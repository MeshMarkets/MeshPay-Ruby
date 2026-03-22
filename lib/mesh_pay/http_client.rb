# frozen_string_literal: true

require "faraday"

module MeshPay
  DEFAULT_BASE_URL = "https://YOUR_PROJECT_REF.supabase.co/functions/v1/api"

  # Low-level HTTP client with auth and idempotency.
  class HttpClient
    def initialize(api_key:, base_url: DEFAULT_BASE_URL, use_x_api_key: false)
      @api_key = api_key
      base = base_url.chomp("/")
      auth_headers = { "Accept" => "application/json" }
      if use_x_api_key
        auth_headers["X-Api-Key"] = api_key
      else
        auth_headers["Authorization"] = "Bearer #{api_key}"
      end
      @conn = Faraday.new(url: base) do |f|
        f.request :json
        f.response :json, content_type: /\bjson$/
        auth_headers.each { |k, v| f.headers[k] = v }
      end
      @public = Faraday.new(url: base) do |f|
        f.request :json
        f.response :json, content_type: /\bjson$/
        f.headers["Accept"] = "application/json"
      end
    end

    def get(path, params = nil)
      r = params ? @conn.get(path, params) : @conn.get(path)
      raise "Mesh Pay API error #{r.status}: #{r.body}" if r.status >= 400
      r.body
    end

    def get_public(path, params = nil)
      r = params ? @public.get(path, params) : @public.get(path)
      raise "Mesh Pay API error #{r.status}: #{r.body}" if r.status >= 400
      r.body
    end

    def post(path, body = {}, idempotency_key: nil)
      headers = {}
      headers["Idempotency-Key"] = idempotency_key if idempotency_key
      r = @conn.post(path, body, headers)
      raise "Mesh Pay API error #{r.status}: #{r.body}" if r.status >= 400
      r.body
    end

    def patch(path, body = {})
      r = @conn.patch(path, body)
      raise "Mesh Pay API error #{r.status}: #{r.body}" if r.status >= 400
      r.body
    end

    def delete(path, params: nil, idempotency_key: nil)
      r = @conn.delete(path) do |req|
        params&.each { |k, v| req.params[k.to_s] = v }
        req.headers["Idempotency-Key"] = idempotency_key if idempotency_key
      end
      raise "Mesh Pay API error #{r.status}: #{r.body}" if r.status >= 400
      r.body
    end
  end
end
