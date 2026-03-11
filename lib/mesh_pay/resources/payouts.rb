# frozen_string_literal: true

module MeshPay
  module Resources
    class PayoutsResource
      def initialize(http)
        @http = http
      end

      def list(limit: nil, cursor: nil, status: nil)
        params = {}
        params[:limit] = limit if limit
        params[:cursor] = cursor if cursor
        params[:status] = status if status
        @http.get("/payouts", params.empty? ? nil : params)
      end

      def get(payout_id:)
        @http.get("/payouts/#{payout_id}")
      end

      def create(account_id:, amount:, idempotency_key: nil)
        @http.post("/payouts", { account_id: account_id, amount: amount }, idempotency_key: idempotency_key)
      end
    end
  end
end
