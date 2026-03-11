# frozen_string_literal: true

module MeshPay
  module Resources
    class WebhookEndpointsResource
      def initialize(http)
        @http = http
      end

      def list
        @http.get("/webhook-endpoints")
      end

      def get(endpoint_id:)
        @http.get("/webhook-endpoints/#{endpoint_id}")
      end

      def create(url:, events:, secret: nil)
        body = { url: url, events: events }
        body[:secret] = secret if secret
        @http.post("/webhook-endpoints", body)
      end

      def update(endpoint_id:, active: nil, events: nil)
        body = {}
        body[:active] = active unless active.nil?
        body[:events] = events if events
        @http.patch("/webhook-endpoints/#{endpoint_id}", body)
      end

      def delete(endpoint_id:)
        @http.delete("/webhook-endpoints/#{endpoint_id}")
      end
    end
  end
end
