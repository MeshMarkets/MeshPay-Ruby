# frozen_string_literal: true

require "openssl"

module MeshPay
  module Webhooks
    def self.verify_signature(payload, signature, secret)
      expected = OpenSSL::HMAC.hexdigest("SHA256", secret, payload)
      return false if expected.bytesize != signature.bytesize
      result = 0
      expected.bytes.zip(signature.bytes) { |a, b| result |= a ^ b }
      result.zero?
    end
  end
end
