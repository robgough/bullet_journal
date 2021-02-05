class BulletJournal
  def initialize(args = [],
                 journal_date = BulletJournal::Day.new)

    @journal_date = journal_date
    @someday = false
    parse_args(args)
  end

  def full_path
    return "#{name}_Someday.md" if @someday

    "#{name}_#{date}_#{weekday}.md"
  end

  def name
    @name ||= "JOURNAL"
  end

  def date
    @journal_date.date
  end

  def weekday
    @journal_date.weekday
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
        when "last"

        when "next"

        when "yesterday"

        when "tomorrow"

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
