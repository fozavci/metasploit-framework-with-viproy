# -*- coding: binary -*-

module Msf::HTTP::Wordpress::Admin
  # Uploads a plugin using a valid admin session.
  #
  # @param name [String] The name of the plugin
  # @param zip [String] The plugin zip file as a string
  # @param cookie [String] A valid admin session cookie
  # @return [Boolean] true on success, false on error
  def wordpress_upload_plugin(name, zip, cookie)
    nonce = wordpress_helper_get_plugin_upload_nonce(cookie)
    if nonce.nil?
      vprint_error("#{peer} - Failed to acquire the plugin upload nonce")
      return false
    end
    vprint_status("#{peer} - Acquired a plugin upload nonce: #{nonce}")

    referer_uri = normalize_uri(wordpress_url_backend, 'plugin-install.php?tab=upload')
    data = Rex::MIME::Message.new
    data.add_part(nonce, nil, nil, 'form-data; name="_wpnonce"')
    data.add_part(referer_uri, nil, nil, 'form-data; name="_wp_http_referer"')
    data.add_part(zip, 'application/octet-stream', 'binary', "form-data; name=\"pluginzip\"; filename=\"#{name}.zip\"")
    data.add_part('Install Now', nil, nil, 'form-data; name="install-plugin-submit"')

    res = send_request_cgi(
      'method'    => 'POST',
      'uri'       => wordpress_url_admin_update,
      'ctype'     => "multipart/form-data; boundary=#{data.bound}",
      'data'      => data.to_s,
      'cookie'    => cookie,
      'vars_get'  => { 'action' => 'upload-plugin' }
    )

    if res && res.code == 200
      vprint_status("#{peer} - Uploaded plugin #{name}")
      return true
    else
      vprint_error("#{peer} - Server responded with code #{res.code}") if res
      vprint_error("#{peer} - Failed to upload plugin #{name}")
      return false
    end
  end
end
