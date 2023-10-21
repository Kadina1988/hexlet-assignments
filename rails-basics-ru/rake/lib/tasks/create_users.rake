require 'csv'

namespace :hexlet do
  desc 'create users'
  task :import_users, [:path]  => :environment do |t, args|

    path = args[:path]


    users_list = CSV.read(path)
    users_list.delete_at(0)

    users_list.each do |user|
      User.create(
                  first_name: user[0],
                  last_name: user[1],
                  birthday: user[2],
                  email: user[3]
                )
    end
  end
end
