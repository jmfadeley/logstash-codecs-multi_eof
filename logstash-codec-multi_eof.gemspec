Gem::Specification.new do |s|
  s.name          = 'logstash-codec-multi_eof'
  s.version       = '0.1.0'
  s.licenses      = ['Apache-2.0']
  s.summary       = 'A multiline codec for handling EOF errors.'
  s.description   = 'This multiline codec that can gracefully handle a lacking \n at EOF in Logstash by adding it at the end.'
  s.homepage      = 'http://amida-tech.com'
  s.authors       = ['James Fadeley']
  s.email         = 'jmfadeley@gmail.com'
  s.require_paths = ['lib']

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "codec" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core-plugin-api", ">= 1.60", "<= 2.99"
  s.add_runtime_dependency 'logstash-codec-line'
  s.add_runtime_dependency 'logstash-codec-multiline'
  s.add_development_dependency 'logstash-devutils'
end
