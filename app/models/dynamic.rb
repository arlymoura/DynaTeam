class Dynamic < ApplicationRecord
  has_many :reviews, dependent: :destroy

  accepts_nested_attributes_for :reviews, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true
end
