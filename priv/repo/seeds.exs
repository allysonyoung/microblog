# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Microblog.Repo.insert!(%Microblog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Microblog.Repo
alias Microblog.Accounts.User
alias Microblog.User.Message

Repo.delete_all(User)
Repo.delete_all(Message)

Repo.insert!(%User{email: "admin@blogurrito.com", is_admin?: true})
Repo.insert!(%User{email: "allyson@blogurrito.com", is_admin?: false})
Repo.insert!(%User{email: "nattuck@blogurrito.com", is_admin?: false})
Repo.insert!(%Message{message: "hello", name: "message1"})
Repo.insert!(%Message{message: "hello", name: "message2"})
