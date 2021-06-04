defmodule LocalizationDemoWeb.Router do
  use LocalizationDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug(SetLocale,
      gettext: LocalizationDemoWeb.Gettext,
      default_locale: "vi",
      cookie_key: "_localization_demo_locale",
      additional_locales: []
    )
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LocalizationDemoWeb do
    pipe_through :browser

    get "/", PageController, :dummy
  end

  scope "/:locale", LocalizationDemoWeb do
    pipe_through :browser
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", LocalizationDemoWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: LocalizationDemoWeb.Telemetry
    end
  end
end
