# Be sure to restart your server when you modify this file.

# Rails.application.config.session_store :cookie_store, key: '_auriga_session', domain: ENV['DOMAIN']
Rails.application.config.session_store :cookie_store, key: '_auriga_session', domain: :all, tld_length: 2
