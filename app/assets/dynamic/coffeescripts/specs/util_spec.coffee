describe 'Util', ->

  describe 'extractDateFromURL', ->
    it 'returns null if last url part is not a date in the correct format', ->
      result = Caldo.Util.extractDateFromURL('some/stuff')
      expect(result).toEqual null

    it 'gives the correct date', ->
			result = Caldo.Util.extractDateFromURL('some/stuff/2012-01-01')
			expect(result).toEqual '2012-01-01'

  describe 'daysBetween', ->
    it 'calculates the number of days between two days where the second date
        is after the first date', ->
      result = Caldo.Util.daysBetween("2012-01-01", "2012-01-05")
      expect(result).toEqual 4

  describe 'shortDate', ->
    it 'converts a date in the form 2012-01-01 back to the correct form', ->
      result = Caldo.Util.shortDate('2012-01-01')
      expect(result).toEqual '2012-01-01'

  describe 'parsableDate', ->
    it 'converts a date 2012-01-05 to a date object on the same date', ->
      result = Caldo.Util.parsableDate('2012-01-20')
      expect(result.getDate()).toEqual(20)
      expect(result.getMonth()).toEqual(0)

  describe 'humanDate', ->
    it 'turns a string from "2012-01-01" to Sunday, January 1st', ->
      result = Caldo.Util.humanDate('2012-01-01')
      expect(result).toEqual 'Sunday, January 1st'

  describe 'previousDate', ->
    it 'returns the previous date', ->
      result = Caldo.Util.previousDate('2012-01-01')
      expect(result).toEqual '2011-12-31'

  describe 'nextDate', ->
    it 'returns the next date', ->
      result = Caldo.Util.nextDate('2012-01-01')
      expect(result).toEqual '2012-01-02'


