# frozen_string_literal: true

module MeshPay
  module Resources
    class WalletsResource
      def initialize(http)
        @http = http
      end

      def list
        @http.get("/wallets")
      end

      def get_detail(membership_id:, network: nil)
        params = {}
        params[:network] = network if network
        @http.get("/wallets/#{membership_id}", params.empty? ? nil : params)
      end

      def list_fiat_accounts(membership_id:)
        @http.get("/wallets/fiat-accounts", { membership_id: membership_id })
      end

      def link_fiat_account(body:, idempotency_key:)
        @http.post("/wallets/fiat-accounts", body, idempotency_key: idempotency_key)
      end

      def unlink_fiat_account(membership_id:, fiat_account_id:, idempotency_key:)
        @http.delete(
          "/wallets/fiat-accounts",
          params: { membership_id: membership_id, fiat_account_id: fiat_account_id },
          idempotency_key: idempotency_key
        )
      end
    end
  end
end
