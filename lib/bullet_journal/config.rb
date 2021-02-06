require 'yaml'

class BulletJournal::Config
  def initialize(file = "~/.config/bullet_journal/config.yml")
    file = File.expand_path(file) # macOS needs this

    puts "Loading config:\n  #{file}"
    @config_file = YAML.load_file(file)
    puts "Default journal name:\n  #{default_journal_name}"
    puts "Default journal location:\n  #{journal_location}"
    puts "Default editor:\n  #{editor}"
    puts
  rescue
    @config_file = {}
  end

  def default_journal_name
    journal.fetch('journal_name', 'JOURNAL')
  end

  def journal_location(journal_name = nil)
    journal_name ||= "default"
    journal(journal_name)
      .fetch('journal_location',
        journal.fetch('journal_location', "."))
  end

  def editor(journal_name = "default")
    journal_name == "default" if journal_name == default_journal_name
    journal(journal_name)
      .fetch('editor',
        journal.fetch('editor', 'vim'))
  end

  private
    def journal(name = "default")
      @config_file.fetch(name.downcase, {})
    end
end
