$LOAD_PATH.unshift(File.dirname(__FILE__))

Dir["initializers/*.rb"].each {|file| require file }
Dir["commands/*.rb"].each {|file| require file }
require 'web'
require 'oauth2'
require 'coinbase/wallet'
require 'commands'
require 'tipbot'
require 'uri'

Thread.new do
  retries = 0
  begin
  	max_retries = 5
    Tipbot.new.run
  rescue Exception => e
  	if retries <= max_retries
  		retries += 1
  		puts "THIS IS ATTEMPT #{retries}"
	    STDERR.puts "ERROR: #{e}"
	    STDERR.puts e.backtrace
		sleep 2 ** retries
    	retry
    else
    	raise "Timeout: #{e.message}"
    end
  end
end

run Web
