class IncompleteTodoView extends Backbone.View
  initialize: ->
    @className = if @options['model'].isImportant() then 'todo important' else 'todo incomplete'
    @setElement(@make(@tagName, class: @className))

  tagName: 'li'

  template: _.template($('#incomplete-todo-template').html())

  render: ->
    @$el.html @template(@model.toJSON())

  events: "click input[type=checkbox]": "markComplete"

  markComplete: ->
    @model.save(complete: true)


@Caldo = window.Caldo || {}
@Caldo.IncompleteTodoView = IncompleteTodoView
