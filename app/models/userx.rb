class Userx < ApplicationRecord
  has_many :orderxes

  validates :cpf, uniqueness: true, presence: true
end
