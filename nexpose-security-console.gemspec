# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','nexpose-security-console','version.rb'])
Gem::Specification.new do |spec|
  spec.name = 'nexpose-security-console'
  spec.version = NexposeSecurityConsole::VERSION
  spec.authors = ['Christian Kyony']
  spec.email = ['ckyony@changamuka.com']
  spec.homepage = 'http://github.com/rhc/nexpose-security-console'
  spec.platform = Gem::Platform::RUBY
  spec.license = 'MIT'

  spec.summary = 'Command line utility to interact with the Nexpose Security Console '
  spec.description   = <<-DESC
    For security engineers
    Who needs to interact with a Rapid7 Nexpose Security console
    The nexpose-security-console gem is a Git like command line utility
    That provides the ability to:

    - create a new site,
    - add an IP to the site,
    - perform a scan against the site using a defined/passed scan template,
    - produce a reports for vulnerabilitie0s, installed software, and policy compliance.
    - to delete in bulk more than 1000 assets in a given site
    - etc

    Unlike the Nexposecli gem and other alternatives,
    nexpose-security-console is designed as command suite a la GIT
  DESC

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0+ is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths << 'lib'

  spec.has_rdoc = true
  spec.extra_rdoc_files = ['README.rdoc','nexpose-security-console.rdoc']
  spec.rdoc_options << '--title' << 'nexpose-security-console' << '--main' << 'README.rdoc' << '-ri'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rdoc'
  spec.add_development_dependency 'aruba'

  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'guard-bundler'
  spec.add_development_dependency 'byebug', '~> 9.0'
  spec.add_development_dependency 'simplecov', '~> 0.12'
  spec.add_development_dependency 'rubocop', '~> 0'
  spec.add_development_dependency 'gem-release', '~> 0'

  spec.add_dependency 'gli','~> 2.15.0'
  spec.add_dependency 'nexpose'
  spec.add_dependency 'dotenv'
  spec.add_dependency 'progress_bar'

end
