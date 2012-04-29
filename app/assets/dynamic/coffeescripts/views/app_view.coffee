class AppView extends Backbone.View
  id: 'top-level-id-for-the-app-goes-here'

  initialize: ->
    preloadData = @options['preloadData']

    @render()

    @collection.on 'reset', @doSomething, this
    @enableKeyboardScrolling()

    new StarterApp.SomeNestedView(collection: @collection, app: this)
    if preloadData then @collection.reset(preloadData) else @collection.fetch()

  events:
    "click a.some-important-link ": "doAThing"

  doAThing: (e) ->
    e?.preventDefault()
    Backbone.history.navigate('some-new-path')

  doOtherThing: (e) ->
    e?.preventDefault()
    Backbone.history.navigate('some-other-path')

  enableKeyboardScrolling: ->
    $('body').keydown (e) =>
      switch e.keyCode
        when 37 then @doAThing()
        when 39 then @doOtherThing()

  template: _.template($('#sample-template').html())

  render: ->
    $('.wrap').empty()
    $('.wrap').append(@el)
    @$el.append(@template(a_variable: @date))

@StarterApp = window.StarterApp || {}
@StarterApp.AppView = AppView
