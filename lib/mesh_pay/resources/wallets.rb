# frozen_string_literal: true

module MeshPay
  module Resources
    class WalletsResource
      def initialize(http)
        @http = http
      end

      def create(account_id:)
        @http.post("/wallets", { account_id: account_id })
      end

      def get_by_account_id(account_id:)
        @http.get("/wallets", { account_id: account_id })
      end
    end
  end
end
