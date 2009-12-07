# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_clube10_session',
  :secret      => '1ace04c0b6fb5a430992b478db21972995e7b2b5207fcc9dea9b9b3ae68e7e8fd98a93b5153b8447dec65b32c33a8543b9d049bd60390d8cd384d8d220a828d9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
