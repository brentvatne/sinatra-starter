describe "Thing model", ->

  describe "state query methods", ->

    describe "isAThing", ->
      it "returns true if thinginess is true", ->
        thing = new StarterApp.Thing thinginess: true
        expect(thing.isAThing()).toBeTruthy()

      it "returns false if not important", ->
        thing = new StarterApp.Thing thinginess: false
        expect(thing.isAThing()).toBeFalsy()
