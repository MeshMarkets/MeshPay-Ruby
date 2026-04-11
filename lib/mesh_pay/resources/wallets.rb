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
    end
  end
end
