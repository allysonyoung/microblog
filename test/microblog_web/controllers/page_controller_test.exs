defmodule MicroblogWeb.PageControllerTest do
  use MicroblogWeb.ConnCase

  test "GET / redirects to message index", %{conn: conn} do
    conn = get conn, message_path(conn, :index)
    assert html_response(conn, 200) =~ "Recent Messages"
  end
end
