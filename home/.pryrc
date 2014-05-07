# -*- coding: utf-8 -*-
# Load plugins (only those I whitelist)
# Pry.config.should_load_plugins = false
# Pry.plugins["doc"].activate!

# # Launch Pry with access to the entire Rails stack.
# # If you have Pry in your Gemfile, you can pass: ./script/console --irb=pry instead.
# # If you don't, you can load it through the lines below :)
# rails = File.join Dir.getwd, 'config', 'environment.rb'

# if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
#   require rails

#   if Rails.version[0..0] == "2"
#     require 'console_app'
#     require 'console_with_helpers'
#   elsif Rails.version[0..0] == "3"
#     require 'rails/console/app'
#     require 'rails/console/helpers'
#   else
#     warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
#   end
# end

# see: https://github.com/lucapette/dotfiles/blob/master/pryrc
# Pry.config.hooks.add_hook :after_session, :say_bye do
#   puts "bye-bye" if Pry.active_sessions == 1
# end

# ============================================================
# Pry.config.command_prefix = "%"
Pry.config.prompt = proc do |obj, level, _|
  prompt = ""
  prompt << "#{Rails.version}@" if defined?(Rails)
  prompt << "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
  prompt =  "\e[32m#{prompt}\e[0m"
  obj_info = "\e[33m#{obj}\e[0m"
  level_info = level == 0 ? "" : ":#{level}"
  "#{prompt} (#{obj_info})#{level_info} > "
end


# ============================================================
# auto_load
auto_loads = %w(awesome_print pry-debugger)
auto_loads.each do |gem|
  begin
    require gem
  rescue LoadError => e
    puts "#{gem} is nothing!! :< | #{e}"
  end
end

# ============================================================
# use always awesome_print
if defined? AwesomePrint
  Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
end


# ============================================================
# pry-debugger alias
if defined? PryDebugger
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'bp','break'
  Pry.commands.alias_command 'bp-c','bp --condition'
  Pry.commands.alias_command 'bp-s','bp --show'
  Pry.commands.alias_command 'bp-delete','bp --delete'
  Pry.commands.alias_command 'bp-delete-all','bp --disable-all'
end


# ============================================================
# benchmark
def time(repetitions = 100, &block)
  require 'benchmark'
  Benchmark.bm{|b| b.report{repetitions.times(&block)}}
end


class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

# ============================================================
# Toys methods
# See https://gist.github.com/807492
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end
class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end


def help2
  print <<HELP
  # _      : 直前の実行結果
  # _ex_   : 直前の例外

  # _in_[n] : 入力値
  # _out_[n]: 出力値

  # _dir_  : show directory path
  # _file_ : show file path

  # find-method  : メソッド検索
  # show-models  : テーブル定義
  # show-routes  : ルーティング表示
  # show-middleware :
  # reload! : Railsリロード
HELP
end
