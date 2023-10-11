# frozen_string_literal: true

class Status < ApplicationRecord
  # BEGIN
  has_one :task
  # END
end
