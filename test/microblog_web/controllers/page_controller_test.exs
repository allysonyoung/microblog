defmodule MicroblogWeb.PageControllerTest do
  use MicroblogWeb.ConnCase

  test "GET / redirects to message index", %{conn: conn} do
    conn = get conn, message_path(conn, :index)

    assert redirected_to(conn) == message_path(conn, :index)
  end
end
