module SimpleTokenAuthentication
  module Configuration

    mattr_accessor :header_names
    mattr_accessor :sign_in_token
    mattr_accessor :adapters

    # Default configuration
    @@header_names = {}
    @@sign_in_token = false
    @@adapters = ['neo4j']

    # Allow the default configuration to be overwritten from initializers
    def configure
      yield self if block_given?
    end
  end
end
