require 'minitest/autorun'
require 'minitest/reporters'
require 'bullet_journal'

Minitest::Reporters.use!

class TestBulletJournal < Minitest::Test
  def setup
  end

  def query_check(expected, query)
    journal_date = BulletJournal::Day.new(Time.new(2021,01,01))
    assert_equal(
      expected,
      BulletJournal.new(query.split, journal_date).full_path
    )
  end

  def test_today
    query_check("JOURNAL_2021-01-01_Friday.md", "")
    query_check("JOURNAL_2021-01-01_Friday.md", "today")
    query_check("BANANA_2021-01-01_Friday.md", "today banana")
  end

  def test_tomorrow
    query_check("JOURNAL_2021-01-02_Saturday.md", "tomorrow")
    query_check("BANANA_2021-01-02_Saturday.md", "tomorrow banana")
    query_check("BANANA-HAMMOCK_2021-01-02_Saturday.md", "tomorrow banana hammock")
  end

  def test_yesterday
    query_check("JOURNAL_2020-12-31_Thursday.md", "yesterday")
    query_check("BANANA_2020-12-31_Thursday.md", "yesterday banana")
  end

  def test_someday
    query_check("JOURNAL_Someday.md", "someday")
    query_check("CUSTOM_Someday.md", "someday custom")
  end

  def test_last_weekday
    query_check("JOURNAL_2020-12-29_Tuesday.md", "last tuesday")
    query_check("WORK_2020-12-29_Tuesday.md", "last tuesday work")
  end

  def test_next_weekday
    query_check("JOURNAL_2021-01-05_Tuesday.md", "next tuesday")
    query_check("WORK_2021-01-05_Tuesday.md", "next tuesday work")
    query_check("JOURNAL_2021-01-05_Tuesday.md", "tuesday")
  end

  def test_last_week
    query_check("JOURNAL_2020-12-25_Friday.md", "last week")
    query_check("WORK_2020-12-25_Friday.md", "last week work")
  end

  def test_next_week
    query_check("JOURNAL_2021-01-04_Monday.md", "next week")
    query_check("WORK_2021-01-04_Monday.md", "next week work")
  end
end
