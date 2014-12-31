root = exports ? this
Linear = (require './linear').Linear

fitness_test = (program) ->
  results = []
  for x in [0..100]
    correct = 2 * x + 10
    results[x] = abs(correct - program.run(i))
  sum = 0
  for i in results
    sum += i
  program.fitness = sum/results.length

crossover = (male_program, female_program) ->
  female_program.a = male_program.a
  male_program.b = female_program.b

mutation = (program) ->
  a_factor = Math.floor(Math.random() * 10)
  b_factor = Math.floor(Math.random() * 10)
  a_negative = Math.floor(Math.random() * 10)
  b_negative = Math.floor(Math.random() * 10)
  if a_negative % 2 is 0
    a_factor = a_factor * -1
  if b_negative % 2 is 0
    b_factor = b_factor * -1
  program.a = a + a_factor
  program.b = a + a_factor

random = ->
  a_factor = Math.floor(Math.random() * 10)
  b_factor = Math.floor(Math.random() * 10)
  a_negative = Math.floor(Math.random() * 10)
  b_negative = Math.floor(Math.random() * 10)
  if a_negative % 2 is 0
    a_factor = a_factor * -1
  if b_negative % 2 is 0
    b_factor = b_factor * -1
  return new Linear(fitness_test, a_factor, b_factor)



generation = (programs) ->
  next = []
  last_best = random()

  sum = 0
  for prog in programs
    sum += prog.fitness
  average = sum/programs.length

  for i in [0..programs.length]
    program = programs[i]
    if  program.fitness < last_best.fitness
      last_best = program

    if last_less_than_average? and program.fitness < average
      next.push(crossover(program, last_less_than_average))
      last_less_than_average = program
    else if not(last_less_than_average?) and program.fitness < average
      last_less_than_average = program

    if program.fitness < average + 10 and (not(program.fitness < average))
      next.push(mutation(program))

  next.push(random()) for j in [0..2]
  next.push(last_best)
  return next

run = ->
  programs = []
  for i in [0..10]
    programs[i] = random

  last_gen = programs
  for j in [0..10]
    last_gen = generation(last_gen)
  console.log last_gen[last_gen.length].run(24)
