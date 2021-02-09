Gem::Specification.new do |s|
  s.name        = 'bullet_journal'
  s.version     = '0.0.1.alpha.1'
  s.summary     = "Helper util for bullet journaling"
  s.description = "Helper utility for managing bullet journal style markdown files via the terminal"
  s.authors     = ["Rob Gough"]
  s.email       = 'bullet_journal@robgough.net'
  s.files       = [
    "lib/bullet_journal.rb",
    "lib/bullet_journal/day.rb",
    "lib/bullet_journal/config.rb",
    "lib/bullet_journal/logger.rb"
  ]
  s.executables << 'jo'
  s.homepage    = 'https://robgough.net/bullet-journal'
  s.metadata    = {
    "source_code_uri" => "https://github.com/robgough/bullet_journal",
    "changelog_uri"   => "https://github.com/robgough/bullet_journal/changelog.md"
  }
end
