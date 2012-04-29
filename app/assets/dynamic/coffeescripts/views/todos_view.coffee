class TodosView extends Backbone.View
  tagName: 'ul'

  className: 'todos'

  initialize: ->
    @app = @options['app']
    @collection.on 'reset',       @render, this
    @collection.on 'change',      @render, this
    @collection.on 'change:date', @render, this

    $(".todos-wrapper").append(@el)

  render: ->
    @$el.empty()

    todo_views = _.map(@collection.allOnDate(@app.date), (todo) ->
      klass = switch todo.isComplete()
        when true  then Caldo.CompleteTodoView
        when false then Caldo.IncompleteTodoView
      new klass(model: todo)
    )

    todo_views = _.sortBy(todo_views, ((view) ->
      score = -1
      score = 0 if view.model.isImportant()
      score = 1 if view.model.isComplete()
      score
    ))

    @$el.append(view.render()) for view in todo_views

@Caldo = window.Caldo || {}
@Caldo.TodosView = TodosView
