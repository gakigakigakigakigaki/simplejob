class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :follow, class_name: 'Company'
  belongs_to :job
  validates :user_id, presence: true
  validates :follow_id, presence: true
end