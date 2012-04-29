describe "Todos collection", ->

  describe "sorting", ->
    it "sorts alphabetically by summary", ->
      todos = Caldo.Todos.reset [ { summary: "Z" }, { summary: "B" }, { summary: "A" } ]

      expect(_.first(todos.models).get('summary')).toEqual "A"
      expect(_.last(todos.models).get('summary')).toEqual "Z"

  describe "scopes", ->
    beforeEach ->
      @todos = Caldo.Todos.reset [
        { important: true,  complete: true },
        { important: true,  complete: true }
        { important: true,  complete: false }
      ]

    describe "incomplete", ->
      it "returns all incomplete tasks", ->
        expect(@todos.incomplete().length).toEqual 1

    describe "complete", ->
      it "returns all complete tasks", ->
        expect(@todos.complete().length, 2).toEqual 2

    describe "important", ->
      it "returns all important tasks", ->
        expect(@todos.important().length).toEqual 3


    describe "allOnDate", ->
      beforeEach ->
        @todos = Caldo.Todos.reset [
          { summary: "A Birthday!",           date: "2011-12-31" },
          { summary: "Buy chicken",           date: "2012-01-01" },
          { summary: "Buy fish",              date: "2012-01-01" },
          { summary: "Car wash day",          date: "2012-01-03" },
          { summary: "Pretend to go fishing", date: "2012-01-03" }
        ]

      it "returns todos on the given date", ->
        results = @todos.allOnDate("2012-01-01")
        first_todo = _.first(results)
        other_todo = _.last(results)

        expect(results.length).toEqual 2
        expect(first_todo.get('summary')).toEqual "Buy chicken"
        expect(other_todo.get('summary')).toEqual "Buy fish"

      it "returns todos that are within three days provided they are important", ->
        _.last(@todos.models).set('important', true)
        results = @todos.allOnDate("2012-01-01")
        last_todo = _.last(results)

        expect(results.length).toEqual 3
        expect(last_todo.get('summary')).toEqual "Pretend to go fishing"

      it "does not include todos that are important but occur before", ->
        _.first(@todos.models).set('important', true)
        results = @todos.allOnDate("2012-01-01")
        first_todo = _.first(results)

        expect(results.length).toEqual 2
        expect(first_todo).toNotBe "A Birthday!"

  describe "updateLastFetchDate", ->
    it "is called on reset", ->
      todos = Caldo.Todos
      expect(todos.lastFetchDate).toBeUndefined()

      todos.setDate('2012-01-01')
      todos.reset([])
      expect(todos.lastFetchDate).toEqual '2012-01-01'

  describe "needsToBeFetched", ->
    it "returns true if last fetch date is three days or more before current day", ->
      todos = Caldo.Todos

      todos.setDate("2012-01-01")
      todos = Caldo.Todos.reset([])

      todos.setDate("2012-01-04")
      expect(todos.needsToBeFetched()).toBeFalsy()

      todos.setDate("2012-01-05")
      expect(todos.needsToBeFetched()).toBeTruthy()

    it "returns true if the last fetch date is more than three days after the current day", ->
      todos = Caldo.Todos

      todos.setDate("2011-12-30")
      todos = Caldo.Todos.reset([])

      todos.setDate("2011-12-27")
      expect(todos.needsToBeFetched()).toBeFalsy()

      todos.setDate("2011-12-26")
      expect(todos.needsToBeFetched()).toBeTruthy()

