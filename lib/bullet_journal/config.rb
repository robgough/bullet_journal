require 'yaml'
require 'pathname'
require 'bullet_journal/logger'

class BulletJournal::Config
  def initialize(
      file: "~/.config/bullet_journal/config.yml",
      logger: BulletJournal::Logger.new)

    @logger = logger
    file = File.expand_path(file) # macOS needs this

    unless Pathname.new(file).exist?
      create_initial_config(file)
    end

    begin
      @config_file = YAML.load_file(file)
    rescue
      @config_file = {}
      @logger.error "Unable to load config file."
    end

    @logger.info "Loaded config:\n  #{file}"
    @logger.info "Default journal name:\n  #{default_journal_name}"
    @logger.info "Default journal location:\n  #{journal_location}"
    @logger.info "Default editor:\n  #{editor}"
    @logger.info
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

    def create_initial_config(file)
      pathname = Pathname(file)
      pathname.dirname.mkpath
      pathname.write(%{
default:
  journal_name: "JOURNAL"
  journal_location: "."
  editor: "vim"
})
    rescue
      @logger.error "Unable to write default config file"
    end
end
