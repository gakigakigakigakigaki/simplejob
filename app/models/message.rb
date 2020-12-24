class Message < ApplicationRecord
  belongs_to :job,optional: true
  belongs_to :user,optional: true
  belongs_to :company,optional: true
end
