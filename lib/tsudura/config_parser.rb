module Tsudura
  class ConfigParser
    def initialize(yml)
      require "erb"
      @config = YAML.load(ERB.new(File.read(yml)).result)
    end

    def attributes
      @config.deep_symbolize_keys
    end
  end
end
