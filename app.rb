require "sinatra/base"

class Application < Sinatra::Base
  get "/hello" do
    name = params[:name]

    return "Hello #{name}"
  end

  get "/names" do
    names = params[:names]

    return "#{names}"
  end

  post "/sort_names" do
    sort_names = params[:sort_names]

    return "#{sort_names.split(",").sort.join(",")}"
  end
end
