class BulletJournal
  def initialize(args = [],
                 day = BulletJournal::Day.new)

    @day = day
    @someday = false
    parse_args(args)
  end

  def full_path
    return "#{name}_Someday.md" if @someday

    "#{name}_#{@day}.md"
  end

  def name
    @name ||= "JOURNAL"
  end

  private
    def parse_args(args)
      return if args.empty?

      case args.shift.downcase
        when "someday"
          @someday = true
        when "today"
        when "yesterday"
          @day.yesterday!
        when "tomorrow"
          @day.tomorrow!
        when "last"
        when "next"
      end
      parse_name(args)
    end

    def parse_name(name_args)
      return if name_args.length == 0
      @name = name_args.join('-').upcase
    end
end

require 'bullet_journal/day.rb'
