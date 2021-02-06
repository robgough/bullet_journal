class BulletJournal
  def initialize(args = [],
                 day = BulletJournal::Day.new,
                 config = BulletJournal::Config.new)

    @day = day
    @someday = false
    @config = config
    parse_args(args)
  end

  def full_path
    File.join(@config.journal_location(name), path)
  end

  def path
    return "#{name}_Someday.md" if @someday

    "#{name}_#{@day}.md"
  end

  def name
    @name ||= "JOURNAL"
  end

  def weekdays
    #todo i18n
    %w[monday tuesday wednesday thursday friday saturday sunday]
  end

  private
    def parse_args(args)
      return if args.empty?

      first_arg = args.shift.downcase
      case first_arg
        when "someday"
          @someday = true
        when "today"
        when "yesterday"
          @day.yesterday!
        when "tomorrow"
          @day.tomorrow!
        when "last"
          @day.previous!(args.shift.downcase)
        when "next"
          @day.next!(args.shift.downcase)
        when *weekdays
          @day.next!(first_arg)
      end
      parse_name(args)
    end

    def parse_name(name_args)
      return if name_args.length == 0
      @name = name_args.join('-').upcase
    end
end

require 'bullet_journal/day.rb'
require 'bullet_journal/config.rb'
