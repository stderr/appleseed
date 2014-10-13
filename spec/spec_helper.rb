require 'bundler/setup'
Bundler.setup

require 'appleseed'

RSpec.configure do |config|
  config.order = :random
  Kernel.srand config.seed
end
