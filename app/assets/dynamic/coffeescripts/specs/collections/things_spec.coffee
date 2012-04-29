describe "Things collection", ->

  describe "scopes", ->
    beforeEach ->
      @things = StarterApp.Things.reset [
        { thinginess: false },
        { thinginess: true }
      ]

    describe "onlyThings", ->
      it "returns all things that are things", ->
        expect(@things.onlyThings().length).toEqual 1
