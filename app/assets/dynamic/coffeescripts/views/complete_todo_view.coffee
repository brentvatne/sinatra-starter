class CompleteTodoView extends Backbone.View
  tagName: 'li'

  className: 'todo complete'

  template: _.template($('#complete-todo-template').html())

  render: ->
    @$el.html @template(@model.toJSON())

  events: "click input[type=checkbox]": "markIncomplete"

  markIncomplete: ->
    @model.save(complete: false)

@Caldo = window.Caldo || {}
@Caldo.CompleteTodoView = CompleteTodoView
