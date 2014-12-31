root = exports ? this

class root.Program
  constructor: (@gender, @fitness) ->

  setRun: (func) -> @run = func
