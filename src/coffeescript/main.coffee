root = exports ? this
Linear = (require './linear').Linear

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
  return new Linear(a_factor, b_factor, gender)
