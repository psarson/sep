require "rack/test"
require "test/unit"
require 'bloc_works'

class BlocWorksRackTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    BlocWorks.new
  end

  def test_root
    get 'http://localhost:3000'
    assert last_response.ok?
  end
end
