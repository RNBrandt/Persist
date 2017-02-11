class User < ApplicationRecord
  has_many :documents

  validates :address, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
