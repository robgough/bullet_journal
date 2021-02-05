class BulletJournal::Day
  def initialize(current_time = Time.now)
    @time = current_time
  end

  def date
    '2021-01-01'
  end

  def weekday
    "Friday"
  end
end
