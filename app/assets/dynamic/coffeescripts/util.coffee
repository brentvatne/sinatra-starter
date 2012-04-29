Util =
  shortDateRegexp: /^\d{4}-\d{2}-\d{2}$/

  # Extracts the current date from the path
  #
  # Returns null if the last part of the path is not a date formatted
  # 2012-01-01, otherwise it returns that date as a string
  extractDateFromURL: (url) ->
    url_part    = _.last((url || window.location.pathname).split('/'))
    if url_part? and @shortDateRegexp.test(url_part) then url_part else null

  # Returns todays date in the form 2012-01-01
  todaysDate: ->
    @shortDate(moment())

  # Formats a given date in the form 2012-01-01, or leaves it if already formatted that way
  #
  # Accepts a moment date object, Date object, or string
  shortDate: (date) ->
    return date if @shortDateRegexp.test(date)
    moment(date).format("YYYY-MM-DD")

  # Calculates the difference in days between the first and second date provided.
  # If the second date comes before the first, the result will be a negative integer, otherwise
  # it will be a positive integer
  #
  # Example: daysBetween("2012-01-01","2012-01-05")
  #          # => 4
  #
  # Returns the number of days difference between the first and second date provided as a
  # positive or negative integer
  daysBetween: (date, otherDate) ->
    date      = moment(@parsableDate(date))
    otherDate = moment(@parsableDate(otherDate))
    otherDate.diff(date, 'days')

  # Takes a string like 2012-01-01 and converts it to a Date object. Typically when moment
  # parses 2012-01-01 you end up with 0:00:00 GMT of that date, so anyone who is in a timezone
  # behind GMT will not get the proper date. This fixes it because the date object makes it instead
  # 0:00:00 of the time zone the client is using.
  #
  # Returns an instance of the Date object
  parsableDate: (date) ->
    if @shortDateRegexp.test(date)
      [year, month, day] = date.split('-')
      new Date(year, month - 1, day)
    else
      date

  # Formats a given date in the form "Monday, January 1st 2012"
  #
  # Accepts a moment date object, Date object, or string
  humanDate: (date) ->
    moment(@parsableDate(date)).format("dddd, MMMM Do")

  # Returns the short date format of the previous date from the date given
  #
  # Accepts a moment date object, Date object, or string
  previousDate: (date) ->
    @shortDate moment(@parsableDate(date)).add('days',-1)

  # Returns the short date format of the next date from the date given
  #
  # Accepts a moment date object, Date object, or string
  nextDate: (date) ->
    @shortDate moment(@parsableDate(date)).add('days', 1)


@Caldo = window.Caldo || {}
@Caldo.Util = Util
