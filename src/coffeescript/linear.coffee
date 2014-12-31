root = exports ? this
Program = (require './program').Program

class root.Linear extends Program
  constructor: (@fitness_test, @a, @b, fitness) ->
    super(fitness)
    @run = (x) -> @a * x + @b
