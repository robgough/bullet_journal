require 'minitest/autorun'
require './bullet_journal'

# How you can call the `Journal`
#   journal [date-modifier (optional)] [journal name (optional)]
#
#   The problem with this is trying to be too clever, we're going
#   to have to carefully limit what the possible options for the
#   date modifier are allowed to be. For now, they are;
#     - `today` (default)
#     - `tomorrow`
#     - `yesterday`
#     - `last <weekday>` (where <weekday> is Monday, Tuesday, Wednesday...)
#     - `last week` the monday of the previous week
#     - `next <weekday>`
#     - `next week` the following Monday
#     - `someday` a special undated case
#
#   Examples;
#     - `bulletjournal` => "JOURNAL_2021-01-01_Friday.md"
#     - `bulletjournal today` => "JOURNAL_2021-01-01_Friday.md"
#     - `bulletjournal yesterday` => "JOURNAL_2020_12_31_Thursday.md"
#     - `bulletjournal yesterday banana` => "BANANA_2020_12_31_Thursday.md"
#     - `bulletjournal next tuesday` => "JOURNAL_2021-01-05_Tuesday.md"
#     - `bulletjournal next tuesday banana` => "BANANA_2021-01-05_Tuesday.md"
#     - `bulletjournal someday` => "JOURNAL_Someday.md"

class TestBulletJournal < Minitest::Test
  def setup
    @journal_date = BulletJournalDate.new(Time.new(2021-01-01))
  end

  def test_no_params_returns_journal_for_today
    assert_equal(
      "JOURNAL_2021-01-01_Friday.md",
      BulletJournal.new.full_name
    )
  end

  def test_just_tomorrow_returns
    assert_equal(
      "JOURNAL_2021-01-02_Saturday.md",
      BulletJournal.new(["tomorrow"]).full_name
    )
  end

  def test_just_someday
    assert_equal(
      "JOURNAL_Someday.md",
      BulletJournal.new(["someday"]).full_name
    )
  end

  def test_someday_with_custom_name
    assert_equal(
      "CUSTOM_Someday.md",
      BulletJournal.new(%w[someday custom]).full_name
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
