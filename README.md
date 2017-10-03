# Microblog
_The functionality of logging in and out was structured based off of Nat Tuck's
NU Mart class example of that same functionality as well as the class notes for CS4550._

* GitHub repo: [here](https://github.com/allysonyoung/microblog)
* Deployed application: [here](http://microblog.breakfastburritos.party)

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Expected Behavior of Microblog application

To log in as a user:
  * Fill in a registered email address in the top right corner and hit 'Log In'.
  * If you don't have a registered email, navigate to the 'Users' link in the nav
  bar, which will take you to the `/users` page. There at the bottom, you can
  click on 'New User' to create a new user. You will only need an email address
  for now.
  * Once you're logged in, you won't be able to see the 'New User' Link in the
  `/users` page, since you can't create a new user while logged in as one. You
  would have to log out if you wish to create a new user.

Notes about users and behaviors associated with users:
  * An admin user was pre-populated in the database. Admin user is the only one
  who can both edit and delete anything (users and messages). Admin user can
  also 'show' a user or a message just like a regular user can.
  * There are also two regular users pre-populated in the database:
  allyson@blogurrito.com and nattuck@blogurrito.com. You are able to log in as
  those users, or create a new user. Creating a new user will add that user to the
  list of users in `/users`.
  * If you create a new user, after filling out the email address, you will get
  redirected to that user's 'Show' page. However, you will still need to log into
  the blog as that new user to be able to access that account.
  * If you try to log in with an unregistered email, you will get a message
  that says 'No such user', and you will remain not logged in.
  * If you're logged in as a regular user, you can edit or delete your account, but you
  can't edit or delete someone else's account. However, you can still view ('Show')
  other accounts.
  * Logging in and logging out will both redirect you to the users listing page.
  * If you are logged in as a user, you will be able to see a 'Follow' button
  when viewing an individual profile ('Show'), but if you're not logged in, you
  won't be able to see the 'Follow' button since you have to be a registered
  user to follow another user. This button currently has no use except for
  aesthetic purposes. Hopefully I can get this to work one day!!!
  * I think my user implementation is a solid 7/10 because the follow functionality
  does not currently work. However, the log in and log out functionality works as
  expected (you can log in and out of a registered user). You can also create,
  edit, and view a user's profile, and I also implemented an admin user
  functionality.

To create a message:
  * The homepage of the microblog app is the messages list feed. There, you can
  create a new message ('New Message' button on the bottom). However, you must
  be logged in as a user to be able to create a message. That button won't be
  visible to someone who is not logged in.
  * Creating a message will initially redirect you to that message's 'Show' page.
  * Admin user is the only user that can delete and edit a message. Regular
  users can only view ('Show') a message right now.
  * I think my message implementation does its job. You can create a new message,
  delete a message or show a message. You can also see a list of all current
  messages in `/messages`.
