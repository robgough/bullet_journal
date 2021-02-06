Gem::Specification.new do |s|
  s.name        = 'bullet_journal'
  s.version     = '0.0.0'
  s.summary     = "Helper for bullet journaling"
  s.description = "Helper for managing bullet journals via the terminal mostly created for the authors benefit"
  s.authors     = ["Rob Gough"]
  s.email       = 'bullet_journal@robgough.net'
  s.files       = [
    "lib/bullet_journal.rb",
    "lib/bullet_journal/day.rb",
    "lib/bullet_journal/config.rb"
  ]
  s.executables << 'bj'
  s.homepage    = 'https://robgough.net/bullet-journal'
  s.metadata    = {
    "source_code_uri" => "https://github.com/robgough/bullet_journal",
    "changelog_uri"   => "https://github.com/robgough/bullet_journal/changelog.md"
  }
end
