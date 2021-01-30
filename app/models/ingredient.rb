class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :doses
  # Note that line below is causing rake to fail, but it gives a nicer
  # error message so I don't care 🤷‍♂️
  has_many :cocktails, through: :doses, dependent: :restrict_with_error
end
