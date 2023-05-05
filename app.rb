require "sinatra/base"
require "sinatra/reloader"

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

  get "/tasks/new" do
    return erb(:new_task)
  end

  post "/tasks" do
    @task_name = params[:task_name]

    return erb(:task_created)
  end
end
