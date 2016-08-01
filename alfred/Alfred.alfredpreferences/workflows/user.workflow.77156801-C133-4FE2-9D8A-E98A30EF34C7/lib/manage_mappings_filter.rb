require 'optparse'
require 'yaml'

$options = {
  mapping: 'project',
  deleting: false,
  mapping_option: nil
}

def set_mapping_options(string, option)
  $options[:mapping] = string
  $options[:mapping_option] = option
end

def create_xml(title, subtitle: nil, valid: false)
  xml = <<EOS
<xml>
<items>
  <item valid="#{valid ? 'yes' : 'no'}" arg="#{ARGV.join(' ')}">
   <title>#{title}</title>
   #{("<subtitle>#{subtitle}</subtitle>") if subtitle}
  </item>
</items>
</xml>
EOS
end

option_parser = OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on('-u', '-o', '--user', '--org', 'This is a Github User/Org mapping') { set_mapping_options('user/org', '-u') }

  opts.on('-c', '--chef-repo', 'This repo is a chef repo mapping') { set_mapping_options('chef repo', '-c') }

  opts.on('-j', '--java-client', 'This is a Java client') { set_mapping_options('java client', '-j') }

  opts.on('-r', '--ruby-client', 'This is a Ruby client') { set_mapping_options('ruby client', '-r') }

  opts.on('--remove', 'Remove the mapping for the given shortcut') { $options[:deleting] = true}
end

begin
  # dup so that ARGV doesn't get messed up if we run into OptionParser error
  option_parser.parse! ARGV.dup
rescue OptionParser::InvalidOption; end

args = ARGV.reject{ |arg| arg.start_with?('-') }

if $options[:deleting]
  message = "Remove #{$options[:mapping]} mapping for \"#{args[0]}\""

  if args.size > 1
    puts create_xml(message, subtitle: "Only \"#{args[0]}\" will be removed. Other input ignored")
  else
    puts create_xml(message, valid: true)
  end
else
  message = "Create #{$options[:mapping]} mapping: \"#{args[0]}\" => \"#{args[1]}\""

  if args.size <= 2
    puts create_xml(message, valid: args.size == 2)
  else
    puts create_xml(message, subtitle: "All input after \"#{args[1]}\" will be ignored", valid: true)
  end
end
