# frozen_string_literal: true

module MeshPay
  module Resources
    class OnRampResource
      def initialize(http)
        @http = http
      end

      def create_session(body:)
        @http.post("/on-ramp/sessions", body)
      end
    end
  end
end
