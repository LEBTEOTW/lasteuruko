Rails.application.config.middleware.use "OmniAuth::Builder" do
  provider :twitter,  'WlV8YNYcURu6cWVmJmx5Pg', 'o0DuKwwyuyXY5SLMq6BvyVkeVedXVo1iNYbmgtot5k'
end

Twitter.configure do |config|
  config.consumer_key    = 'WlV8YNYcURu6cWVmJmx5Pg'
  config.consumer_secret = 'o0DuKwwyuyXY5SLMq6BvyVkeVedXVo1iNYbmgtot5k'
end