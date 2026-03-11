# frozen_string_literal: true

module MeshPay
  module Resources
    class OnRampResource
      def initialize(http)
        @http = http
      end

      def get_quote(amount_usd: nil, amount_usdc: nil)
        body = {}
        body[:amount_usd] = amount_usd if amount_usd
        body[:amount_usdc] = amount_usdc if amount_usdc
        @http.post("/on-ramp/quote", body)
      end

      def execute_trade(quote_id:, idempotency_key: nil)
        @http.post("/on-ramp/trade", { quote_id: quote_id }, idempotency_key: idempotency_key)
      end
    end
  end
end
