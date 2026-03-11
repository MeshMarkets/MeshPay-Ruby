# frozen_string_literal: true

module MeshPay
  module Resources
    class OffRampResource
      def initialize(http)
        @http = http
      end

      def get_quote(amount_usdc: nil, amount_usd: nil)
        body = {}
        body[:amount_usdc] = amount_usdc if amount_usdc
        body[:amount_usd] = amount_usd if amount_usd
        @http.post("/off-ramp/quote", body)
      end

      def execute_trade(quote_id:, idempotency_key: nil)
        @http.post("/off-ramp/trade", { quote_id: quote_id }, idempotency_key: idempotency_key)
      end
    end
  end
end
