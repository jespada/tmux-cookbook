require "chefspec"
require "chefspec/berkshelf"
require "chefspec/cacher"
require_relative "support/matchers"

RSpec.configure do |config|
  config.color = true
  # config.raise_errors_for_deprecations!
end

at_exit { ChefSpec::Coverage.report! }
end
