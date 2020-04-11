# frozen_string_literal: true

# `Rack::Attack` is configured to use the `Rails.cache` value by default,
# but you can override that by setting the `Rack::Attack.cache.store` value
# Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

# Allow all local traffic
Rack::Attack.safelist('allow from localhost') do |req|
  # Requests are allowed if the return value is truthy
  '127.0.0.1' == req.ip || '::1' == req.ip
end


# Allow an IP address to make 5 requests every 5 seconds
Rack::Attack.throttle('req/ip', limit: 5, period: 5) do |req|
  req.ip
end

# Send the following response to throttled clients
Rack::Attack.throttled_response = ->(env) {
  retry_after = (env['rack.attack.match_data'] || {})[:period]
  [
    429,
    { 'Content-Type' => 'application/json', 'Retry-After' => retry_after.to_s },
    [{ error: 'Throttle limit reached. Retry later.' }.to_json]
  ]
}