root = exports ? this
Program = (require './program').Program

class root.Linear extends Program
  constructor: (@fitness_test, @a, @b, gender, fitness) ->
    super(gender, fitness)
    @run = (x) -> @a * x + @b
