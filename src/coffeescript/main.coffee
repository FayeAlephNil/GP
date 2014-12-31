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
  gender_factor = Math.floor(Math.random() * 10)
  gender = 'male'
  if a_negative % 2 is 0
    a_factor = a_factor * -1
  if b_negative % 2 is 0
    b_factor = b_factor * -1
  if gender_factor % 2 is 0
    gender = 'female'
  return new Linear(fitness_test, a_factor, b_factor, gender)



generation = (programs) ->
  next = []
  last_best = random()
  for i in [0..programs.lengrh]
    program = programs[i]
    if  program.fitness < last_best.fitness
      last_best = program
  next.push(last_best)
  return next

run = ->
  programs = []
  for i in [0..10]
    programs[i] = random
