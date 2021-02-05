require 'minitest/autorun'
require './journal'

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
#     - `journal` => "JOURNAL_2021-01-01_Friday.md"
#     - `journal today` => "JOURNAL_2021-01-01_Friday.md"
#     - `journal yesterday` => "JOURNAL_2020_12_31_Thursday.md"
#     - `journal yesterday banana` => "BANANA_2020_12_31_Thursday.md"
#     - `journal next tuesday` => "JOURNAL_2021-01-05_Tuesday.md"
#     - `journal next tuesday banana` => "BANANA_2021-01-05_Tuesday.md"
#     - `journal someday` => "JOURNAL_Someday.md"

class TestJournal < Minitest::Test
  def setup
    @journal_date = JournalDate.new(Time.new(2021-01-01))
  end

  def test_no_params_returns_journal_for_today
    assert_equal(
      "JOURNAL_2021-01-01_Friday.md",
      Journal.new.full_name
    )
  end

  def test_just_tomorrow_returns
    assert_equal(
      "JOURNAL_2021-01-02_Saturday.md",
      Journal.new(["tomorrow"]).full_name
    )
  end

  def test_just_someday
    assert_equal(
      "JOURNAL_Someday.md",
      Journal.new(["someday"]).full_name
    )
  end

  def test_someday_with_custom_name
    assert_equal(
      "CUSTOM_Someday.md",
      Journal.new(%w[someday custom]).full_name
    )
  end

  def test_reads_out_diary_name_after_multi_word_date
    assert_equal(
      "BANANA",
      Journal.new(["banana"]).name
    )
  end

  def test_custom_multiword_name_joins_with_hyphen
    assert_equal(
      "BANANA-HAMMOCK",
      Journal.new(%w[banana hammock]).name
    )
  end
end
