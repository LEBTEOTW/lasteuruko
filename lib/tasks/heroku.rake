namespace :heroku do
  desc "Reads config/last_euruko.yml and sends config vars to Heroku ..."
  task :config do
    Bundler.with_clean_env do
      puts "Reading config/last_euruko.yml and sending config vars to Heroku ..."
      config = YAML.load_file(Rails.root + 'config/last_euruko.yml')['production'] rescue {}
      system("heroku config:add LAST_EURUKO_CONFIG=#{Shellwords.escape(YAML.dump(config))}")
    end
  end
end
