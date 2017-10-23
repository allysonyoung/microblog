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
alias Microblog.User.Like
alias Microblog.User.Follow

Repo.delete_all(Follow)
Repo.delete_all(User)
Repo.delete_all(Message)
Repo.delete_all(Like)

user1 = %User{email: "admin@blogurrito.com", password: "blogadmin",
  password_confirmation: "blogadmin", is_admin?: true}
user1 = Repo.insert!(user1)

user2 = %User{email: "allyson@blogurrito.com", password: "allysonblog",
  password_confirmation: "allysonblog",is_admin?: false}
user2 = Repo.insert!(user2)

user3 = %User{email: "nattuck@blogurrito.com", password: "nattuckblog",
  password_confirmation: "nattuckblog", is_admin?: false}
user3 = Repo.insert!(user3)

Repo.insert!(%Message{message: "hello", name: "message1", user_id: user1.id})
Repo.insert!(%Message{message: "hello", name: "message2", user_id: user2.id})
