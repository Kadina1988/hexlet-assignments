10.times do
  Task.create(
    name: "#{Faker::Verb.simple_present}",
    creator: Faker::Name.name,
    performer: Faker::Name.name,
    completed: Faker::Boolean.boolean
  )
end
