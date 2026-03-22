# frozen_string_literal: true

module MeshPay
  module Resources
    class OffRampResource
      def initialize(http)
        @http = http
      end

      def create_session(body:)
        @http.post("/off-ramp/sessions", body)
      end
    end
  end
end
