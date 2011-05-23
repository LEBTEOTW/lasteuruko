require 'yaml'
require 'hashie'

module LastEuruko

  module ConfigLoader
    class << self
      def load
        # Load environment settings and fallback on yaml file settings
        Hashie::Mash.new(load_file.merge(load_env) || {})
      end

      private

      def load_env
        ENV['LAST_EURUKO_CONFIG'] ? YAML.load(ENV['LAST_EURUKO_CONFIG']) : {}
      end

      def load_file
        file = Rails.root + 'config/last_euruko.yml'
        File.exists?(file) ? YAML.load_file(file)[Rails.env] : {}
      end
    end
  end

  Config = ConfigLoader.load

end
