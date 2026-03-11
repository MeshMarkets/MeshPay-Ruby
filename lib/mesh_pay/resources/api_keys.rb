# frozen_string_literal: true

module MeshPay
  module Resources
    class ApiKeysResource
      def initialize(http)
        @http = http
      end

      def list
        @http.get("/api-keys")
      end

      def create(name: nil)
        body = name ? { name: name } : {}
        @http.post("/api-keys", body)
      end

      def delete(api_key_id:)
        @http.delete("/api-keys/#{api_key_id}")
      end
    end
  end
end
