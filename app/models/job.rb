class Job < ApplicationRecord
  belongs_to :company
  has_many :messages
  has_one :prefecture
  
  has_many :relationships
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :jikyu
    validates :period
    validates :number_of_people
    validates :contents
    validates :prefecture_id
    validates :working_hours
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
