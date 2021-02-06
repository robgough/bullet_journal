class BulletJournal::Day
  def initialize(time = Time.now)
    @time = time
  end

  def to_s
    @time.strftime("%Y-%m-%d_%A")
  end

  def yesterday!
    @time -= 86400
  end

  def tomorrow!
    @time += 86400
  end
end
