# Changelog

## 3.1.0

- **Added** `create_pooled_charge` on charges; `create_contribution`, `set_payee`, `cancel_pooled_escrow` on escrows (pooled flows per OpenAPI).

## 3.0.0

- **Removed** fiat-account wallet helpers. Use `on_ramp` / `off_ramp` `create_session` instead.

## 2.0.0

Breaking — OpenAPI v1 alignment. Removed `payouts` and `api_keys`. `MeshPay::Client` accepts `use_x_api_key`. See MeshPay-JS CHANGELOG for API changes.
