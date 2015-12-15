class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :title, presence: true
  validates :title, length: { min: 40 }
  validates :user, presence: true
  validates :description, presence: true
  validates :description, length: { min: 150 }
end
