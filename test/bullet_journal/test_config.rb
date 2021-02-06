require 'test_bullet_journal'
require 'pathname'

class TestBulletJournal::Config < Minitest::Test
  def setup
    @config =
      BulletJournal::Config.new(
        file: './test/bullet_journal/config.test.yml',
        logger: BulletJournal::Logger.new(enabled: false))
  end

  def test_can_read_default_journal_name
    assert_equal("JOURNAL", @config.default_journal_name)
  end

  def test_can_read_default_journal_dir
    assert_equal("tmp/",
                 @config.journal_location)
  end

  def test_returns_custom_journal_dir_when_specified_in_config
    assert_equal("~/Documents/work-notes",
                 @config.journal_location("WORK"))
  end

  def test_returns_default_journal_dir_when_not_in_config
    assert_equal("tmp/",
                 @config.journal_location("BANANA"))
  end

  def test_gracefully_handle_a_missing_config_file
    config = BulletJournal::Config.new(
      file: './no-file.yml',
      logger: BulletJournal::Logger.new(enabled: false))
    assert_equal(".", config.journal_location)
  end

  def test_returns_default_editor
    assert_equal("none", @config.editor("work"))
    assert_equal("nvim", @config.editor("JOURNAL"))
    assert_equal("nvim", @config.editor(""))
  end

  def test_writes_default_config_file_if_missing
    tmp_config_file = "tmp/config.yml"
    pathname = Pathname.new(tmp_config_file)
    pathname.delete if pathname.exist?
    config = BulletJournal::Config.new(
      file: tmp_config_file,
      logger: BulletJournal::Logger.new(enabled: false))

    assert(pathname.exist?, "tmp config file not found")
    pathname.delete if pathname.exist?
    assert(!pathname.exist?, "unable to remove tmp config file")
  end
end
