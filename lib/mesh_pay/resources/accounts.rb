# frozen_string_literal: true

module MeshPay
  module Resources
    class AccountsResource
      def initialize(http)
        @http = http
      end

      def list
        @http.get("/accounts")
      end

      def create(email:)
        @http.post("/accounts", { email: email })
      end

      def delete_membership(membership_id:)
        @http.delete("/accounts/#{membership_id}")
      end
    end
  end
end
