require 'serverspec'

set :backend, :exec

# Load Variables for variables.yml
def load_configuration (key)
    configuration = YAML.load_file 'variables.yml'
    configuration['vars'][key].map do |package|
      package.kind_of?(Hash) ? package['name'] : package
    end
end

# Load Homebrew packages
def homebrew_packages
    load_configuration 'homebrew_packages'
end

def git_conf
  load_configuration 'git_conf'
end