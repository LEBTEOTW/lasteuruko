OmniAuth.config.path_prefix = '/join_the_destruction'

Rails.application.config.middleware.use "OmniAuth::Builder" do
  provider :twitter, LastEuruko::Config.twitter.consumer_key, LastEuruko::Config.twitter.consumer_secret
end