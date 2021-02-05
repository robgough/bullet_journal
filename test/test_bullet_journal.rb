require 'minitest/autorun'
require 'minitest/reporters'
require 'bullet_journal'

Minitest::Reporters.use!

class TestBulletJournal < Minitest::Test
  def setup
    @journal_date = BulletJournal::Day.new(Time.new(2021-01-01))
  end

  def test_no_params_returns_journal_for_today
    assert_equal(
      "JOURNAL_2021-01-01_Friday.md",
      BulletJournal.new.full_path
    )
  end

  def test_today_specified
    assert_equal(
      "JOURNAL_2021-01-01_Friday.md",
      BulletJournal.new(["today"]).full_path
    )
  end

  def test_today_specified_with_journal
    assert_equal(
      "BANANA_2021-01-01_Friday.md",
      BulletJournal.new(%w[ today banana]).full_path
    )
  end

  def test_just_tomorrow_returns
    assert_equal(
      "JOURNAL_2021-01-02_Saturday.md",
      BulletJournal.new(["tomorrow"]).full_path
    )
  end

  def test_just_someday
    assert_equal(
      "JOURNAL_Someday.md",
      BulletJournal.new(["someday"]).full_path
    )
  end

  def test_someday_with_custom_name
    assert_equal(
      "CUSTOM_Someday.md",
      BulletJournal.new(%w[someday custom]).full_path
    )
  end

  def test_reads_out_diary_name_after_multi_word_date
    assert_equal(
      "BANANA",
      BulletJournal.new(["banana"]).name
    )
  end

  def test_custom_multiword_name_joins_with_hyphen
    assert_equal(
      "BANANA-HAMMOCK",
      BulletJournal.new(%w[banana hammock]).name
    )
  end
end
