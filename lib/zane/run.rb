require 'celluloid/autostart'
require "selenium-webdriver"

class Zane::Browser
  include Celluloid

  finalizer :phantom_shutdown

  def initialize ports
    @port = open_port(ports)
    @pipe = IO.popen "phantomjs --webdriver=#{@port}"
    sleep(3) # We need to wait for phantom to start FAR from ideal
    @driver = Selenium::WebDriver.for(
      :remote, 
      :url => "http://127.0.0.1:#{@port}", 
      :listener => Zane::Listener.new
    )

    puts "Phantom Instance Running PID : #{@pipe.pid} on Port : #{@port}"
  end

  def visit url
    @driver.navigate.to url
    puts @driver.title 
  end 

  def phantom_shutdown
    Process.kill("TERM", @pipe.pid)
    puts "Phantom Instance shutdown PID : #{@pipe.pid}"
  end

  private 

  # We need to find an open port before we
  def open_port ports
    ports.find do |port|
      begin
        s = TCPSocket.new("127.0.0.1", port)
        s.close
        next false
      rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
        next true
      end
    end
  end
end

