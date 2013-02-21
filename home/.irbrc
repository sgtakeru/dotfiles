# -*- coding: utf-8 -*-
# ============================================================
# Define COLOR
# ============================================================
ANSI = {}
ANSI[:RESET] = "\e[0m"
ANSI[:BOLD] = "\e[1m"
ANSI[:UNDERLINE] = "\e[4m"
ANSI[:LGRAY] = "\e[0;37m"
ANSI[:GRAY] = "\e[0;90m"
ANSI[:RED] = "\e[31m"
ANSI[:GREEN] = "\e[32m"
ANSI[:YELLOW] = "\e[33m"
ANSI[:BLUE] = "\e[34m"
ANSI[:MAGENTA] = "\e[35m"
ANSI[:CYAN] = "\e[36m"
ANSI[:WHITE] = "\e[37m"

# ===========================
# IRB初期設定
module IRB
  class Context
    attr_reader :count
    def mock_evaluate(line, line_no)
      begin
        old_evaluate(line, line_no)
      rescue NoMethodError, NameError
        @count += 1
        if @count > 2
          print "(ﾟДﾟ#)ねーよ!!!\n"
          @count = 0
        end
        raise
      end
    end

    def mock_initialize(irb, workspace = nil, input_method = nil, output_method = nil)
      old_initialize(irb, workspace = nil, input_method = nil, output_method = nil)
      @count = 0
    end
    alias_method :old_evaluate, :evaluate
    alias_method :evaluate, :mock_evaluate

    alias_method :old_initialize, :initialize
    alias_method :initialize, :mock_initialize

  end
end


# tab 補完
require 'irb/completion'

# 履歴
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"


# ============================================================
# Define PROMPT
# ============================================================
# # 新しいプロンプトモード MY_PROMPT を作成する
# IRB.conf[:PROMPT][:MY_PROMPT] = {
#   :PROMPT_I => nil,          # 通常時のプロンプト
#   :PROMPT_N => nil,          # 継続行のプロンプト
#   :PROMPT_S => nil,          # 文字列などの継続行のプロンプト
#   :PROMPT_C => nil,          # 式が継続している時のプロンプト
#   :RETURN => "    ==>%s\n"   # メソッドから戻る時のプロンプト
# }
module DynamicPrompt
  def self.apply!
    IRB.conf[:PROMPT][:INFORMATIVE] = {
      :PROMPT_I => "#{DynamicPrompt.normal} > ",
      :PROMPT_N => "#{DynamicPrompt.normal} > ",
      :PROMPT_S => "#{DynamicPrompt.normal}%l ",
      :PROMPT_C => "#{DynamicPrompt.normal}*> ",
      :RETURN => "#{ANSI[:RED]}=>#{ANSI[:RESET]} %.2048s\n"
    }
    IRB.conf[:PROMPT_MODE] = :INFORMATIVE
  end

  def self.normal
    head = "#{ANSI[:YELLOW]}%N(%m)"
    line = "#{ANSI[:CYAN]}%03n"
    ruby = "#{ANSI[:MAGENTA]}#{ANSI[:BOLD]}#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}#{ANSI[:RESET]}"
    dir  = "#{ANSI[:BLUE]}#{cwd}#{ANSI[:RESET]}"
    indent = "#{ANSI[:GRAY]}%i#{ANSI[:RESET]}"
    [head, line, ruby, dir, indent]. * ":"
  end
  private
  def self.cwd
    pwd = Dir.pwd
    case pwd
    when '/'
      '/'
    when ENV['HOME']
      '~'
    else
      pwd.split('/').last
    end
  end
end
DynamicPrompt.apply!

# ============================================================
# Load gems
# ============================================================
def load_gem(name, lib=nil, &block)
  lib = name unless lib
  #Gem.activate(name)
  require lib
  yield if block_given?
rescue LoadError => e
  puts "#{ANSI[:RED]}no #{name}#{ANSI[:RESET]}"
end

# load gem
load_gem 'awesome_print', 'ap'



# ============================================================
# Debug設定
if defined? Debugger
  Debugger.settings[:autoeval] = 1
  Debugger.settings[:autolist] = 1
end



# ============================================================
# 天気
def weather
  require 'rubygems'
  require 'restclient'
  require 'json'
  time = case Time.now.hour
         when 0..5
           0
         when 6..11
           1
         when 12..17
           2
         when 18..24
           3
         end

  str = RestClient.get 'http://www.drk7.jp/weather/json/40.js'
  today = JSON.parse(str[23, str.length-2-23])["pref"]["area"]["筑豊地方"]["info"][0]

  weather = today["weather"]
  rain = today["rainfallchance"]["period"][time]
  temperature = today["temperature"]["range"].map{|v| %!#{v["centigrade"]}:#{v["content"]}!} * "/"
  "筑豊地方(#{weather} | 降水確率 #{rain["hour"]}:#{rain["content"]}% | 気温 #{temperature})"
end

def anime
  require 'rubygems'
  require 'restclient'
  require 'json'
  str = RestClient.get 'http://animemap.net/api/table/fukuoka.json'
  j = JSON.parse str
  puts j["response"]["item"].map{|v| %!#{v["week"]}-#{v["time"]} #{v["title"]}\n! }
end



# ============================================================
# Message

print <<BOOT_MSG
#{ANSI[:BLUE]}#{ANSI[:BOLD]}--------------------------------------------------------------
             _/          _/
               _/  _/_/ _/_/_/   _/  _/_/   _/_/_/
           _/ _/_/     _/    _/ _/_/     _/
          _/ _/       _/    _/ _/       _/
         _/ _/       _/_/_/   _/         _/_/_/
#{ANSI[:RESET]}                                     #{ANSI[:GREEN]}( ﾟДﾟ)_σ ~/.irbrc loaded
#{ANSI[:RESET]}#{weather}
BOOT_MSG

# p(1..100).each{|x|p x%15==0?"FizzBuzz":x%3==0?"Fizz":x%5==0?"Buzz":x}
# ============================================================
# Define useful methods
# ============================================================
def time(repetitions = 100, &block)
  require 'benchmark'
  Benchmark.bm{|b| b.report{repetitions.times(&block)}}
end

def longlong
  1000000.times do |i|
    Hash.new
    Array.new
  end
end
def reload
  exec($0)
end

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

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
