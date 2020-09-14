lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'players'
require 'scraper'
require 'version'

Gem::Specification.new do |spec|
  spec.name = 'nba_players'
  spec.version = NbaPlayers::VERSION
  spec.required_ruby_version = '>= 2.6.1'
  spec.authors = ["'Josue Abraham'"]
  spec.email = ["'josuea@noukod.com'"]

  spec.summary = 'This gem is for showing the top 100 nba players (season 17-18)'
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage = 'https://github.com/Joecleverman/capstone_ruby'
  spec.license = 'MIT'

  # spec.platform     = Gem::Platform::RUBY
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   # spec.metadata["allowed_push_host"] = "https://rubygems.org/"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  # spec.bindir        = "exe"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables << 'nba_players'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_dependency 'colorize', '~> 0.8.0'
  spec.add_dependency 'nokogiri', '~> 1.10'
  spec.add_dependency 'terminal-table', '~> 1.8', '>= 1.7.9'
end
