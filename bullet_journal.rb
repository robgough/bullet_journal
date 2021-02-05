#!/usr/bin/env ruby
class BulletJournal
  def initialize(args = [],
                 journal_date = BulletJournalDate.new)

    parse_args(args)
    @journal_date = journal_date
  end

  def full_name
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

class BulletJournalDate
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

puts BulletJournal.new(ARGV).full_name
