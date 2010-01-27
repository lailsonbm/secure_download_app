# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_secure_download_app_session',
  :secret      => '9cbafb5dd74d7c638f2ea8b6fd69531cb794169530937918350eda021d7bf8893c7a90ac306c9ddbef7f454fdc6fc0a499b5c2fd6fdbfd22c7fd022113244f74'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
