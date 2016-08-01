require 'optparse'
require 'yaml'

USER_MAPPINGS_FILE = 'lib/user_mappings.yml'

options = {
  mapping_type: :projects,
  deleting: false
}

OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on('-u', '-o', '--user', '--org', 'This is a Github User/Org mapping') { options[:mapping_type] = :users }

  opts.on('-c', '--chef-repo', 'This repo is a chef repo mapping') { options[:mapping_type] = :chef }

  opts.on('-j', '--java-client', 'This is a Java client') { options[:mapping_type] = :java }

  opts.on('-r', '--ruby-client', 'This is a Ruby client') { options[:mapping_type] = :ruby }

  opts.on('-r', '--remove', 'Remove the mapping for the given shortcut') { options[:deleting] = true}
end.parse!

shortcut = ARGV[0]
mapping = ARGV[1]

user_mappings =
  (YAML.load_file(USER_MAPPINGS_FILE) if File.exist?(USER_MAPPINGS_FILE)) || {projects: {}, chef: {}, users: {}, java: {}, ruby: {}}

if options[:deleting]
  user_mappings[options[:mapping_type]].delete(shortcut)
else
  user_mappings[options[:mapping_type]][shortcut] = mapping
end

File.open(USER_MAPPINGS_FILE, 'w') do |file|
  file.write user_mappings.to_yaml
end
