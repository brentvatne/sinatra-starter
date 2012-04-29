class Router extends Backbone.Router
  routes:
    "":      "today"
    "today": "today"
    ":date": "specificDate"

  today: ->
    @initializeAppView Caldo.Util.todaysDate()

  specificDate: (date) ->
    unless @initializeAppView(date)
      if Caldo.Util.shortDateRegexp.test(date)
        @appView.setDate(date)

  initializeAppView: (date) ->
    unless @appView
      @appView = new Caldo.AppView
        date: date, collection: Caldo.Todos, preloadData: Caldo.preloadData

@Caldo = window.Caldo || {}
@Caldo.Router = Router
