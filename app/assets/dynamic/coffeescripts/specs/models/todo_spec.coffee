describe "Todo model", ->

  describe "id", ->

    it "should use the event_id as the id attribute", ->
      todo = new Caldo.Todo event_id: 1234
      expect(todo.id).toEqual(1234)

    it "should not be new if it has an event_id attribute", ->
      todo = new Caldo.Todo event_id: 1234
      expect(todo.isNew()).toBeFalsy()

    it "should be new if it has no event_id attribute", ->
      todo = new Caldo.Todo
      expect(todo.isNew()).toBeTruthy()

  describe "state query methods", ->

    describe "isImportant", ->
      it "returns true if important", ->
        todo = new Caldo.Todo important: true
        expect(todo.isImportant()).toBeTruthy()

      it "returns false if not important", ->
        todo = new Caldo.Todo important: false
        expect(todo.isImportant()).toBeFalsy()

    describe "isComplete", ->
      it "returns true if complete", ->
        todo = new Caldo.Todo complete: true
        expect(todo.isComplete()).toBeTruthy()

      it "returns false if not important", ->
        todo = new Caldo.Todo complete: false
        expect(todo.isComplete()).toBeFalsy()
