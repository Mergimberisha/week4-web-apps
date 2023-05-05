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

  context "POST /sort_names" do
    it "should sort the names out alphabatical order" do
      response = post("/sort_names?sort_names=Joe,Alice,Zoe,Julia,Kieran")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end
  end

  context "GET /tasks/new" do
    it "should return the html form to create a new task" do
      response = get("/tasks/new")

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/tasks">')
      expect(response.body).to include('<input type="text" name="task_name" />')
    end
  end

  context "POST /tasks" do
    it "should create task and return confirmation page" do
      response = post("tasks", task_name: "Buy a dog")

      expect(response.status).to eq(200)
      expect(response.body).to include ("<h1>You saved task: Buy a dog</h1>")
    end

    it "should create task and return confirmation page with a differnt name" do
      response = post("tasks", task_name: "Sell a cat")

      expect(response.status).to eq(200)
      expect(response.body).to include ("<h1>You saved task: Sell a cat</h1>")
    end
  end
end
