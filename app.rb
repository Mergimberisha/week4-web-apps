require "sinatra/base"

class Application < Sinatra::Base
  # GET /
  #Root path (homepage, index page)
  get "/" do
    return "Hello!"
  end

  get "/posts" do
    name = params[:name]
    cohort_name = params[:cohort_name]

    return "Hello #{name}, you are in the cohort #{cohort_name}"
  end

  post "/posts" do
    title = params[:title]

    return "Post was created with title: #{title}"
  end

  get "/hello" do
    name = params[:name]
    return "Hello #{name}"
  end
end

# Incoming request: GET /posts

# Routes:

# GET /     -> execute some code

# GET /todos/1    -> execute some code

# POST /todos     -> execute some code
