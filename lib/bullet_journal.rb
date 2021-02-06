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
      return if args[0].nil?

      case args[0].downcase
        when "someday"
          @someday = true
          parse_name(args[1..])
        when "today"
          parse_name(args[1..])
        when "yesterday"
          @day.yesterday!
          parse_name(args[1..])
        when "tomorrow"
          @day.tomorrow!
          parse_name(args[1..])
        when "last"

          parse_name(args[2..])
        when "next"

          parse_name(args[2..])
        else
          parse_name(args)
      end
    end

    def parse_name(name_args)
      return if name_args.length == 0
      @name = name_args.join('-').upcase
    end
end

require 'bullet_journal/day.rb'
