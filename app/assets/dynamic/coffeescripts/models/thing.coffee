class Thing extends Backbone.Model
  isAThing: -> @get("thinginess")

@StarterApp = window.StarterApp || {}
@StarterApp.Thing = Thing
