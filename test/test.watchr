# test/test.watchr
require 'autowatchr'

Autowatchr.new(self) do |config|
  config.ruby = 'ruby'
end
