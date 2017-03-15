# -*- coding:binary -*-
require 'spec_helper'

require 'msf/core'
require 'msf/core/exploit'
require 'rex/proto/http/response'
require 'msf/http/wordpress'

describe Msf::HTTP::Wordpress::Login do
  subject do
    mod = ::Msf::Exploit.new
    mod.extend ::Msf::HTTP::Wordpress
    mod.send(:initialize)
    mod
  end

  describe '#wordpress_login' do
    before :each do
      allow(subject).to receive(:send_request_cgi) do |opts|
        res = Rex::Proto::Http::Response.new
        res.code = 301
        if wp_redirect
          res['Location'] = wp_redirect
        else
          res['Location'] = opts['vars_post']['redirect_to']
        end
        res['Set-Cookie'] = wp_cookie
        res.body = 'My Homepage'
        res
      end
    end

    let(:wp_redirect) { nil }

    context 'when current Wordpress' do
      let(:wp_cookie) { 'wordpress_logged_in_1234=1234;' }
      it { expect(subject.wordpress_login('user', 'pass')).to eq(wp_cookie) }
    end

    context 'when current Wordpress sec cookie' do
      let(:wp_cookie) { 'wordpress_sec_logged_in_1234=1234;' }
      it { expect(subject.wordpress_login('user', 'pass')).to eq(wp_cookie) }
    end

    context 'when Wordpress 2.5' do
      let(:wp_cookie) { 'wordpress_asdf=1234;' }
      it { expect(subject.wordpress_login('user', 'pass')).to eq(wp_cookie) }
    end

    context 'when Wordpress 2.0 user cookie' do
      let(:wp_cookie) { 'wordpressuser_1234=1234;' }
      it { expect(subject.wordpress_login('user', 'pass')).to eq(wp_cookie) }
    end

    context 'when Wordpress 2.0 pass cookie' do
      let(:wp_cookie) { 'wordpresspass_1234=1234;' }
      it { expect(subject.wordpress_login('user', 'pass')).to eq(wp_cookie) }
    end

    context 'when invalid login' do
      let(:wp_cookie) { 'invalid=cookie;' }
      it { expect(subject.wordpress_login('invalid', 'login')).to be_nil }
    end

    context 'when invalid redirect' do
      let(:wp_cookie) { 'invalid=cookie;' }
      let(:wp_redirect) { '/invalid/redirect' }
      it { expect(subject.wordpress_login('invalid', 'login')).to be_nil }
    end

  end

end
