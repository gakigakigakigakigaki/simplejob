class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :jobs
  has_many :mesaages
  has_many :likes, dependent: :destroy
  has_many :like_jobs, through: :likes, source: :job
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :company
  
  

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :first_name, format: { with:/\A[ぁ-んァ-ン一-龥]/}
    validates :last_name, format: { with:/\A[ぁ-んァ-ン一-龥]/}
    validates :first_name_kana, format: { with:/\A[ァ-ヶー－]+\z/}
    validates :last_name_kana, format:  { with:/\A[ァ-ヶー－]+\z/}
  end

end
