class Todo extends Backbone.Model
  idAttribute: "event_id"

  isComplete:  -> @get("complete")

  isImportant: -> @get("important")

  markComplete: ->

  markIncomplete: ->

@Caldo = window.Caldo || {}
@Caldo.Todo = Todo
