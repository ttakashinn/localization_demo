defmodule LocalizationDemoWeb.PageController do
  use LocalizationDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
