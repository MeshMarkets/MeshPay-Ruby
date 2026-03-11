# frozen_string_literal: true

module MeshPay
  module Resources
    class ChargesResource
      def initialize(http)
        @http = http
      end

      def list(limit: nil, cursor: nil, status: nil)
        params = {}
        params[:limit] = limit if limit
        params[:cursor] = cursor if cursor
        params[:status] = status if status
        @http.get("/charges", params.empty? ? nil : params)
      end

      def get(charge_id:)
        @http.get("/charges/#{charge_id}")
      end

      def create(buyer_id:, seller_account_id:, amount:, currency: "USDC", idempotency_key: nil)
        @http.post(
          "/charges",
          { buyer_id: buyer_id, seller_account_id: seller_account_id, amount: amount, currency: currency },
          idempotency_key: idempotency_key
        )
      end

      def fund(charge_id:, entity_secret_ciphertext:, idempotency_key: nil)
        @http.post(
          "/charges/#{charge_id}/fund",
          { entity_secret_ciphertext: entity_secret_ciphertext },
          idempotency_key: idempotency_key
        )
      end

      def refund(charge_id:, amount: nil, idempotency_key: nil)
        body = amount ? { amount: amount } : {}
        @http.post("/charges/#{charge_id}/refund", body, idempotency_key: idempotency_key)
      end
    end
  end
end
