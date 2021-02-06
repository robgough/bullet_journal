require 'yaml'

class BulletJournal::Config
  def initialize(file = "~/.config/bullet_journal/config.yml")
    file = File.expand_path(file) # macOS needs this
    puts "Loading config from #{file}"
    @config_file = YAML.load_file(file)
    puts "Default journal name: #{default_journal_name}"
    puts "Default journal location: #{journal_location}"
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

  private
    def journal(name = "default")
      @config_file.fetch(name.downcase, {})
    end
end
