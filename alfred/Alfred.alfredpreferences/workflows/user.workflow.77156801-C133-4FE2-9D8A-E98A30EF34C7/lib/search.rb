# github:  https://github.cerner.com/search?q=survival
# org:     https://github.cerner.com/hi-infra?query=client
# project: https://github.cerner.com/hi-infra/client_directory_service/search?q=client

#!/ausr/bin/env ruby
require 'optparse'
require 'yaml'

DEFAULT_MAPPINGS_FILE = 'lib/default_mappings.yml'
USER_MAPPINGS_FILE = 'lib/user_mappings.yml'

DEFAULT_MAPPINGS = YAML.load_file(DEFAULT_MAPPINGS_FILE)
USER_MAPPINGS = (YAML.load_file(USER_MAPPINGS_FILE) if File.exist?(USER_MAPPINGS_FILE)) || Hash.new({})

PROJECT_MAPPINGS = DEFAULT_MAPPINGS[:projects].merge(USER_MAPPINGS[:projects])
GIT_USER_MAPPINGS = DEFAULT_MAPPINGS[:users].merge(USER_MAPPINGS[:users])

options = {
  server: 'https://github.cerner.com'
}

searches = {
  global: "/search?q="
  user: "query="
  project: "/search?q="
}

option_parser = OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on('-p', '--project PROJECT', 'Github project repo') { |project| options[:project_input] = project }

  opts.on('-u', '-o', '--user USER', '--org Org', 'Github User/Org') { |user| options[:user] = user }

  opts.on('-c', '--chef-repo', 'This repo is a chef repo') { options[:chef] = '_chef-repo' }

  opts.on('-j', '--java-client', 'This is a Java client') { options[:java] = '-client' }

  opts.on('-r', '--ruby-client', 'This is a Ruby client') { options[:ruby] = '_client' }

  opts.on('--server Server', 'Github Server') { |server| options[:server] = server }
end

user = GIT_USER_MAPPINGS[options[:user]] || options[:user]

if options[:project_input]
  project_input = options[:project_input]

  project = PROJECT_MAPPINGS[project_input] || project_input

  project_type = [:chef, :java, :ruby].find{ |type| options[type] }

  if project_type
    type_overrides = DEFAULT_MAPPINGS[project_type].merge(USER_MAPPINGS[project_type])
    if type_overrides[project_input]
      project = type_overrides[project_input]
    else
      project = "#{project}#{options[project_type]}"
    end
  end
end


url = [options[:server], "search?q=#{ARGV.join(' ')}"].reject(&:empty?).join('/')

puts url
