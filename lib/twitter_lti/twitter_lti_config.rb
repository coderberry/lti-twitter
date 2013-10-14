module TwitterLti
  module TwitterLtiConfig

    def self.load_config
      YAML::load(File.open(config_file))[Rails.env]
    end

    def self.config_file
      TwitterLti.app_root.join('config/twitter_lti_config.yml')
    end

    def self.setup!
      if File.exists?(config_file)
        Rails.logger.info "Loading environment variables in #{config_file}"
        config = load_config
        config.map { |k, v| ENV[k.upcase] = v }
      else
        raise "Warning: File does not exist: #{config_file} for #{Rails.env})."
      end
    end
  end
end
