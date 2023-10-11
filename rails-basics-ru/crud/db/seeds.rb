# frozen_string_literal: true

10.times do
  Task.create(
    name: Faker::Verb.simple_present.to_s,
    creator: Faker::Name.name,
    performer: Faker::Name.name,
    completed: Faker::Boolean.boolean
  )
end
