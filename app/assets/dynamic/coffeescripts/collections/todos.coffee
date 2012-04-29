class Todos extends Backbone.Collection
  initialize: ->
    @on 'reset', @updateLastFetchDate, this

  model: Caldo.Todo

  comparator: (todo) ->
    todo.get('summary')

  complete: ->
    _.filter @models, (todo) -> todo.isComplete()

  incomplete: ->
    _.reject @models, (todo) -> todo.isComplete()

  important: ->
    _.filter @models, (todo) -> todo.isImportant()

  url: () -> '/todos/' + @date

  setDate: (@date) ->
    @trigger 'change:date'
    @fetch() if @needsToBeFetched()

  updateLastFetchDate: ->
    @lastFetchDate = @date

  needsToBeFetched: ->
    @threeDaysApart(@date, @lastFetchDate)

  # Public: Filters out models based on their date
  #
  # Returns all models that occur on the given date, or are important
  # and within five days
  allOnDate: (date) ->
    _.filter @models, (todo) =>
      todoDate = todo.get('date')
      todoDate == date or
        (todo.isImportant() and @upToThreeDaysLater(date, todoDate))

  upToThreeDaysLater: (date, otherDate) ->
    daysBetween = Caldo.Util.daysBetween(date, otherDate)
    daysBetween < 3 and daysBetween > 0

  threeDaysApart: (date, otherDate) ->
    daysBetween = Caldo.Util.daysBetween(date, otherDate)
    daysBetween > 3 or daysBetween < -3

@Caldo = window.Caldo || {}
@Caldo.Todos = new Todos
