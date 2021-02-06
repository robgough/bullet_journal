class BulletJournal::Day
  def initialize(time = Time.now)
    @time = time
  end

  def to_s
    @time.strftime("%Y-%m-%d_%A")
  end

  def day_name
    @time.strftime("%A")
  end

  def yesterday!
    @time -= 86400
  end

  def tomorrow!
    @time += 86400
  end

  def previous!(requested_day_name)
    requested_day_name = "friday" if requested_day_name == "week"
    begin
      yesterday!
    end while day_name.downcase != requested_day_name
  end

  def next!(requested_day_name)
    requested_day_name = "monday" if requested_day_name == "week"
    begin
      tomorrow!
    end while day_name.downcase != requested_day_name
  end
end
