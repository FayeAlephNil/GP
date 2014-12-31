root = exports ? this
Program = (require './program').Program

class root.Linear extends Program
  constructor: (@a, @b, gender) ->
    super(gender)
    @run = (x) -> @a * x + @b
