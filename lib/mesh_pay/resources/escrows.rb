# frozen_string_literal: true

module MeshPay
  module Resources
    class EscrowsResource
      def initialize(http)
        @http = http
      end

      def list(limit: nil, status: nil)
        params = {}
        params[:limit] = limit if limit
        params[:status] = status if status
        @http.get("/escrows", params.empty? ? nil : params)
      end

      def get(escrow_id:)
        @http.get("/escrows/#{escrow_id}")
      end

      def release(escrow_id:, idempotency_key:)
        @http.post("/escrows/#{escrow_id}/release", {}, idempotency_key: idempotency_key)
      end

      def open_dispute(escrow_id:, tx_hash:)
        @http.post("/escrows/#{escrow_id}/open-dispute", { tx_hash: tx_hash })
      end

      def resolve_dispute(escrow_id:, release_to_seller:, idempotency_key:)
        @http.post(
          "/escrows/#{escrow_id}/resolve-dispute",
          { release_to_seller: release_to_seller },
          idempotency_key: idempotency_key
        )
      end
    end
  end
end
