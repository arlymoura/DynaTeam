class Dynamic < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
