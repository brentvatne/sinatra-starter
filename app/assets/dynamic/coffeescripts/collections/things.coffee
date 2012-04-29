class Things extends Backbone.Collection
  initialize: ->
    @on 'reset', @doSomething, this

  model: StarterApp.Thing

  doSomething: ->
    # whatever you want

  onlyThings: ->
    @filter (thing) ->
      thing.isAThing()

  comparator: (thing) ->
    thing.get('name')

@StarterApp = window.StarterApp || {}
@StarterApp.Things = new Things
