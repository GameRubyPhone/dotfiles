#!/usr/bin/env ruby
# Checklist before code review
require 'io/console'
require 'pry'
require 'colorize'
require 'yaml'

class CheckList

  RIGHT_SIGN  = "\xE2\x9C\x85".force_encoding('utf-8')
  X_SIGN = "\xE2\x9D\x8C".force_encoding('utf-8')
  TAURUS = "\xE2\x99\x89\xEF\xB8\x8F".force_encoding('utf-8')

  CONFIG_YAML_FILE = './config_checklist.yml'
  LAST_RESULT = './cl.temp'

  def initialize
    system 'cd ~/dotfiles/bin/'
    system 'clear'
    @user_inputs = File.exist?(LAST_RESULT)? YAML::load_file(LAST_RESULT) : []
    @check_list = YAML.load_file(CONFIG_YAML_FILE)
    @user_inputs_index = 0
  end

  def write_array_yaml(array)
    File.open(LAST_RESULT, 'w') {|f| f.write(YAML::dump(array)) }
    pretty_print('q')
    Kernel.exit
  end

  def clean
    puts 'Delete temporary file?'
    system "rm #{LAST_RESULT}" if /[yY]/.match(STDIN.getch)
  end

  def run
    @check_list.each do |e|
      next if e[0] == 'unused'
      puts e[1]["name"]
      e[1]["list"].each.with_index { |v, i| list_item_for_code_review(i+1, v); @user_inputs_index += 1 }
    end
    clean
  end

  def user_input(&block)
    loop do
      case result=STDIN.getch
      when 'y', 'Y'
        yield result ; pretty_print('y'); break
      when 'n', 'N'
        yield result ; pretty_print('n'); break
      when 'q', 'Q'
        write_array_yaml(@user_inputs)
      else
        puts "\tPlease answer yes(y) or no(n). (Q)uit."; next
      end
    end
    true
  end

  def pretty_print(option)
    words = ''
    case option
    when 'y'
      words = "\t#{RIGHT_SIGN}\tWell Done!"
    when 'n'
      words = "\t#{X_SIGN}\tOops"
    when 'q'
      words = "\t#{TAURUS}\tC U"
    end
    puts words
  end

  def colorize_string(string)
    string.gsub(/\#{[^}]*}/) do |match|
      a = match.delete('#{}').split('.')
      a[0].send(a[1])
    end
  end

  # Public: format checklist string and output based on result
  def list_item_for_code_review(line_num, list_item)
    list_item = colorize_string(list_item)
    print "\t#{line_num}. #{list_item}\t"
    #binding.pry
    case @user_inputs[@user_inputs_index]
    when 'y', 'Y'
      pretty_print('y'); return
    when 'n', 'Y'
      return if user_input { |result| @user_inputs[@user_inputs_index] = result }
    end

    user_input { |result| @user_inputs << result }
  end

end 

c = CheckList.new
c.run
