root = exports ? this

class root.Program
  constructor: (@gender) ->

  setRun: (func) -> @run = func
