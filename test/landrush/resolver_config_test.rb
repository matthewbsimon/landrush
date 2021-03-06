require 'test_helper'

module Landrush
  describe ResolverConfig do
    describe 'ensure_config_exists' do
      it 'writes a resolver config on the host if one is not already there' do
        resolver_config = ResolverConfig.new(fake_environment)
        resolver_config.config_file.exist?.must_equal false
        resolver_config.ensure_config_exists!
        resolver_config.config_file.exist?.must_equal true
        resolver_config.config_file.read.must_equal <<-EOF.gsub(/^ +/, '')
          # Generated by landrush, a vagrant plugin
          nameserver 127.0.0.1
          port 10053
        EOF
      end


    end
  end
end
