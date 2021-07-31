require 'spec_helper'

homebrew_packages.each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

describe command('git flow version') do
  its(:stdout) { should match /AVH Edition/ }
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
  its(:stdout) { should match /py390/ }
end

describe command('nodenv versions') do
  its(:stdout) { should match /10.15.3/ }
end

describe command('source ~/.bash_profile && node -v') do
  its(:stdout) { should match /v14.17.4/ }
end

describe command('tfenv list') do
  its(:stdout) { should match /0.11.13/ }
end

describe command('terraform -v') do
  its(:stdout) { should match /0.11.13/ }
end

describe command('source ~/.bash_profile && go version') do
  its(:stdout) { should match /1.12.7/ }
end

describe command('gradle -v') do
  its(:stdout) { should match /Gradle/ }
end

describe command('source ~/.bash_profile && yarn --version') do
  its(:stdout) { should match /1./ }
end
