# frozen_string_literal: true

require_relative "version"
require_relative "http_client"
require_relative "webhooks"
require_relative "resources/health"
require_relative "resources/accounts"
require_relative "resources/wallets"
require_relative "resources/charges"
require_relative "resources/escrows"
require_relative "resources/webhook_endpoints"
require_relative "resources/on_ramp"
require_relative "resources/off_ramp"

module MeshPay
  # Main client for the Mesh Pay API with full API and separation of concerns.
  class Client
    def initialize(api_key:, base_url: HttpClient::DEFAULT_BASE_URL, use_x_api_key: false)
      @http = HttpClient.new(api_key: api_key, base_url: base_url, use_x_api_key: use_x_api_key)
    end

    def health
      Resources::HealthResource.new(@http)
    end

    def accounts
      Resources::AccountsResource.new(@http)
    end

    def wallets
      Resources::WalletsResource.new(@http)
    end

    def charges
      Resources::ChargesResource.new(@http)
    end

    def escrows
      Resources::EscrowsResource.new(@http)
    end

    def webhook_endpoints
      Resources::WebhookEndpointsResource.new(@http)
    end

    def on_ramp
      Resources::OnRampResource.new(@http)
    end

    def off_ramp
      Resources::OffRampResource.new(@http)
    end

    def webhooks
      Webhooks
    end
  end
end
