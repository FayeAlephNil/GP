root = exports ? this

class root.Program
  constructor: (@fitness) ->

  setRun: (func) -> @run = func
