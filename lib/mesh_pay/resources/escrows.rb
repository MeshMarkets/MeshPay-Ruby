# frozen_string_literal: true

module MeshPay
  module Resources
    class EscrowsResource
      def initialize(http)
        @http = http
      end

      def list(limit: nil, cursor: nil, status: nil)
        params = {}
        params[:limit] = limit if limit
        params[:cursor] = cursor if cursor
        params[:status] = status if status
        @http.get("/escrows", params.empty? ? nil : params)
      end

      def get(escrow_id:)
        @http.get("/escrows/#{escrow_id}")
      end

      def release(escrow_id:, idempotency_key: nil)
        @http.post("/escrows/#{escrow_id}/release", {}, idempotency_key: idempotency_key)
      end
    end
  end
end
