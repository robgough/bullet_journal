class BulletJournal::Day
  def initialize(time = Time.now)
    @time = time
  end

  def date
    @time.strftime("%Y-%m-%d_%A")
  end
end
