defmodule Todo.Router do
  use Todo.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Todo do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", Todo do
    pipe_through :api
    post "/todos", TodoController, :create
    patch "/todos/:id", TodoController, :update
    delete "/todos/:id", TodoController, :delete
    resources "/todos", TodoController, except: [:new, :edit]
  end
end