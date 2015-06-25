require 'spec_helper'

describe 'gpg' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "gpg class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('gpg::params') }
          it { is_expected.to contain_class('gpg::install').that_comes_before('gpg::config') }
          it { is_expected.to contain_class('gpg::config') }
          it { is_expected.to contain_class('gpg::service').that_subscribes_to('gpg::config') }

          it { is_expected.to contain_service('gpg') }
          it { is_expected.to contain_package('gpg').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'gpg class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('gpg') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
