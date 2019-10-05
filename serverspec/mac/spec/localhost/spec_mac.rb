require 'spec_helper'

homebrew_packages.each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

describe command('git --version') do
  its(:stdout) { should match /(?!Apple Git-98)/ }
end

git_conf.each do |conf|
  describe command('git config --global -l') do
    its(:stdout) { should match /#{conf}/ }
  end
end

describe command('pyenv versions') do
  its(:stdout) { should match /py361/ }
end

describe command('nodenv versions') do
  its(:stdout) { should match /10.15.3/ }
end

describe command('node -v') do
  its(:stdout) { should match /v10.15.3/ }
end

describe command('tfenv list') do
  its(:stdout) { should match /0.11.13/ }
end

describe command('terraform -v') do
  its(:stdout) { should match /0.11.13/ }
end

describe command('docker --version') do
  its(:stdout) { should match /Docker version/ }
end