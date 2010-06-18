require 'irb/completion'
require 'irb/ext/save-history'
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
IRB.conf[:AUTO_INDENT]=true

require 'rubygems'
require 'wirble'
Wirble.init
Wirble.colorize

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

# Add a helper to deal with the fact that logger is not defined in 
# in script/console
unless Object.respond_to?(:logger) || Object.new.respond_to?(:logger)
  def logger
    RAILS_DEFAULT_LOGGER if defined? RAILS_DEFAULT_LOGGER
  end
end
