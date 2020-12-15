class Job < ApplicationRecord
  belongs_to :company
  has_one :application_record
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :jikyu
    validates :period
    validates :number_of_people
    validates :contents
    validates :prefecture_id
    validates :working_hours
    validates :image
  end
end
