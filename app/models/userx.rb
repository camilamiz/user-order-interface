class Userx < ApplicationRecord
  has_many :orderxs

  validates :cpf, uniqueness: true, presence: true
end
