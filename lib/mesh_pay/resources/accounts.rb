# frozen_string_literal: true

module MeshPay
  module Resources
    class AccountsResource
      def initialize(http)
        @http = http
      end

      def create(email:)
        @http.post("/accounts", { email: email })
      end
    end
  end
end
