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

      def create(body:, idempotency_key:)
        @http.post("/charges", body, idempotency_key: idempotency_key)
      end

      def fund(charge_id:, body:, idempotency_key:)
        @http.post("/charges/#{charge_id}/fund", body, idempotency_key: idempotency_key)
      end

      def cancel(charge_id:, idempotency_key:)
        @http.post("/charges/#{charge_id}/cancel", {}, idempotency_key: idempotency_key)
      end

      def refund(charge_id:, body: {}, idempotency_key:)
        @http.post("/charges/#{charge_id}/refund", body, idempotency_key: idempotency_key)
      end
    end
  end
end
