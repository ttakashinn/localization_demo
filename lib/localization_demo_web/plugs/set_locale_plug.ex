defmodule LocalizationDemoWeb.Plugs.SetLocale do
  import Plug.Conn

  @supported_locales Gettext.known_locales(LocalizationDemoWeb.Gettext)

  @max_age 60*60*24*30 # 30 ngày

  def init(_opts), do: nil

  def call(conn, _options) do
    case fetch_locale_from(conn) do
      nil ->
        conn
      locale ->
        Gettext.put_locale(LocalizationDemoWeb.Gettext, locale)
        conn |> put_resp_cookie("locale", locale, max_age: @max_age)
    end
  end

  defp fetch_locale_from(conn) do
    (conn.params["locale"] || conn.cookies["locale"]) |> check_locale
  end

  defp check_locale(locale) when locale in @supported_locales, do: locale
  defp check_locale(_), do: nil
end
