include RSpec
require "bloc_works"
require "rack/test"
require "test/unit"

RSpec.describe BlocWorks do
  include Rack::Test::Methods

  let(:app) { BlocWorks::Application.new }


  describe "#call" do
    it "returns the status 200" do
      get "/"
      expect(last_response.status).to eq 200
    end

    it "returns the body" do
      get "/"
      expect(last_response.body).to eq "Hello Blocheads!"
    end
  end


end
