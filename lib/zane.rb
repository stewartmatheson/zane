Zane = Module.new

require 'zane/version'
require 'zane/listener'
require 'zane/browser'

module Zane
  self.start
    browser_pool = Celluloid::SupervisionGroup.run!
    browser_pool.pool Zane::Browser, as: :browser_pool, args: [ port_range ]
  end

  self.visit url, &block
    Celluloid::Actor[:browser_pool].async.visit url
  end

  private

  def port_range
    Celluloid.cpus.times.map{|i| 9134 + i }
  end
end
