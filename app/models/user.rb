class User < ApplicationRecord
  has_many :orders

  validates :cpf, uniqueness: true, presence: true
end
