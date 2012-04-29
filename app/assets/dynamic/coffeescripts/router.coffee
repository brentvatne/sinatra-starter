class Router extends Backbone.Router
  routes:
    "":      "home"
    ":variable": "someVariableAction"

  home: ->
    @initializeAppView

  someVariableAction: (variableIsPassedHere) ->
    # do something with the variable

  initializeAppView: ->
    unless @appView
      @appView = new StarterApp.AppView
        collection: StarterApp.Things
        preloadData: StarterApp.preloadData

@StarterApp = window.StarterApp || {}
@StarterApp.Router = Router
