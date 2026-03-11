# frozen_string_literal: true

require "faraday"

module MeshPay
  # Low-level HTTP client with auth and idempotency.
  class HttpClient
    def initialize(api_key:, base_url: "http://localhost:3000")
      @api_key = api_key
      @conn = Faraday.new(url: base_url.chomp("/")) do |f|
        f.request :json
        f.response :json
        f.headers["Authorization"] = "Bearer #{api_key}"
      end
    end

    def get(path, params = nil)
      r = params ? @conn.get(path, params) : @conn.get(path)
      raise "Mesh Pay API error #{r.status}: #{r.body}" if r.status >= 400
      r.body
    end

    def post(path, body = {}, idempotency_key: nil)
      headers = idempotency_key ? { "Idempotency-Key" => idempotency_key } : {}
      r = @conn.post(path, body, headers)
      raise "Mesh Pay API error #{r.status}: #{r.body}" if r.status >= 400
      r.body
    end

    def patch(path, body = {})
      r = @conn.patch(path, body)
      raise "Mesh Pay API error #{r.status}: #{r.body}" if r.status >= 400
      r.body
    end

    def delete(path)
      r = @conn.delete(path)
      raise "Mesh Pay API error #{r.status}: #{r.body}" if r.status >= 400
      r.body
    end
  end
end
