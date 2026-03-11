# frozen_string_literal: true

module MeshPay
  module Resources
    class HealthResource
      def initialize(http)
        @http = http
      end

      def get
        @http.get("/health")
      end
    end
  end
end
