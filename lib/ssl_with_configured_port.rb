module SslWithConfiguredPort
  extend ActiveSupport::Concern

  module ClassMethods
    def force_ssl_with_configured_port(options = {})
      options[:port] = Rails.application.config.ssl_port if options[:port].blank? && Rails.application.config.try(:ssl_port).present?
      force_ssl options
    end
  end
end
