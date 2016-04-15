require 'spec_helper'
 
describe 'fpm', :type => 'class' do

  context "Should install fpm" do

    let(:params) { { :ruby_versions => ['2.0.0'] } }

    it do
      should contain_package('gcc')
      should contain_package('ruby-dev')
      should contain_rvm_gem('ruby-2.0.0/fpm').with(
        'ruby_version' => 'ruby-2.0.0',
        'ensure' => 'latest'
      )
    end
  end

  context "Should install fpm version" do

    let(:params) { { :ruby_versions => ['2.0.0'], :version => '1.4.0' } }

    it do
      should contain_package('gcc')
      should contain_package('ruby-dev')
      should contain_rvm_gem('ruby-2.0.0/fpm').with(
          'ruby_version' => 'ruby-2.0.0',
          'ensure' => '1.4.0'
      )
    end
  end

  context "Should install multiple fpms" do

    let(:params) { { :ruby_versions => ['2.0.0', '1.9.3'] } }

    it do
      should contain_package('gcc')
      should contain_package('ruby-dev')
      should contain_rvm_gem('ruby-2.0.0/fpm').with(
        'ruby_version' => 'ruby-2.0.0'
      )
      should contain_rvm_gem('ruby-1.9.3/fpm').with(
        'ruby_version' => 'ruby-1.9.3'
      )
    end
  end

  context "Should install fpm on RedHat" do

    let(:facts) { { :osfamily => 'RedHat' } }
    let(:params) { { :ruby_versions => ['2.0.0'] } }

    it do
      should contain_package('gcc')
      should contain_package('ruby-devel')
      should contain_rvm_gem('ruby-2.0.0/fpm').with(
          'ruby_version' => 'ruby-2.0.0'
      )
    end
  end
end
