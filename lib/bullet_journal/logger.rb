class BulletJournal::Logger
  def initialize(enabled: true)
    @enabled = enabled
  end

  def info(message = "")
    log(message)
  end

  def error(message = "")
    log "[error] #{message}"
  end

  private
    def log(message)
      puts message if @enabled
    end
end
