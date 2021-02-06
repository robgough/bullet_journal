require 'minitest/autorun'
require 'minitest/reporters'
require 'bullet_journal'

Minitest::Reporters.use!

class TestBulletJournal < Minitest::Test
  def setup
  end

  def query_check(expected, query)
    journal_date = BulletJournal::Day.new(Time.new(2021,01,01))
    config = BulletJournal::Config.new("./test/bullet_journal/config.test.yml")
    assert_equal(
      expected,
      BulletJournal.new(query.split, journal_date, config).full_path
    )
  end

  def test_today
    query_check("tmp/JOURNAL_2021-01-01_Friday.md", "")
    query_check("tmp/JOURNAL_2021-01-01_Friday.md", "today")
    query_check("tmp/BANANA_2021-01-01_Friday.md", "today banana")
    query_check("tmp/HELLO_2021-01-01_Friday.md", "hello")
  end

  def test_tomorrow
    query_check("tmp/JOURNAL_2021-01-02_Saturday.md", "tomorrow")
    query_check("tmp/BANANA_2021-01-02_Saturday.md", "tomorrow banana")
    query_check("tmp/BANANA-HAMMOCK_2021-01-02_Saturday.md", "tomorrow banana hammock")
  end

  def test_yesterday
    query_check("tmp/JOURNAL_2020-12-31_Thursday.md", "yesterday")
    query_check("tmp/BANANA_2020-12-31_Thursday.md", "yesterday banana")
  end

  def test_someday
    query_check("tmp/JOURNAL_Someday.md", "someday")
    query_check("tmp/CUSTOM_Someday.md", "someday custom")
  end

  def test_last_weekday
    query_check("tmp/JOURNAL_2020-12-29_Tuesday.md", "last tuesday")
    query_check("~/Documents/work-notes/WORK_2020-12-29_Tuesday.md", "last tuesday work")
  end

  def test_next_weekday
    query_check("tmp/JOURNAL_2021-01-05_Tuesday.md", "next tuesday")
    query_check("~/Documents/work-notes/WORK_2021-01-05_Tuesday.md", "next tuesday work")
    query_check("tmp/JOURNAL_2021-01-05_Tuesday.md", "tuesday")
  end

  def test_last_week
    query_check("tmp/JOURNAL_2020-12-25_Friday.md", "last week")
    query_check("~/Documents/work-notes/WORK_2020-12-25_Friday.md", "last week work")
  end

  def test_next_week
    query_check("tmp/JOURNAL_2021-01-04_Monday.md", "next week")
    query_check("~/Documents/work-notes/WORK_2021-01-04_Monday.md", "next week work")
  end
end
