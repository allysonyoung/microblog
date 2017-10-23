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

user1password = "blogadmin"
user1 = %User{email: "admin@blogurrito.com", password: user1password,
  password_confirmation: user1password, is_admin?: true, password_hash: Comeonin.Argon2.hashpwsalt(user1password)}
user1 = Repo.insert!(user1)

user2password = "allysonblog"
user2 = %User{email: "allyson@blogurrito.com", password: user2password,
  password_confirmation: user2password, is_admin?: false, password_hash: Comeonin.Argon2.hashpwsalt(user2password)}
user2 = Repo.insert!(user2)

user3password = "nattuckblog"
user3 = %User{email: "nattuck@blogurrito.com", password: user3password,
  password_confirmation: user3password, is_admin?: false, password_hash: Comeonin.Argon2.hashpwsalt(user3password)}
user3 = Repo.insert!(user3)

Repo.insert!(%Message{message: "hello", name: "message1", user_id: user1.id})
Repo.insert!(%Message{message: "hello", name: "message2", user_id: user2.id})
