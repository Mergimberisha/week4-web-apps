require "sinatra/base"

class Application < Sinatra::Base
  get "/hello" do
    name = params[:name]

    return "Hello #{name}"
  end
end
