Gem::Specification.new do |s|
  s.name        = "mesh-pay"
  s.version     = "1.0.0"
  s.summary     = "Mesh Pay API client for Ruby"
  s.authors     = ["Mesh Pay"]
  s.files       = Dir["lib/**/*.rb"]
  s.add_runtime_dependency "faraday", "~> 2.0"
end
