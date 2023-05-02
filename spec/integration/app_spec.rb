require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /hello" do
    it 'should return "Hello Mergz"' do
      response = get("/hello?name=Mergz")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Mergz")
    end

    it 'should return "Hello Ber"' do
      response = get("/hello?name=Ber")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Ber")
    end
  end

  context "GET /names" do
    it 'should return "Hello Julia, Mary, Karim"' do
      response = get("/names?names=Julia, Mary, Karim")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end
  end
end
