class User < ApplicationRecord
  has_many :documents

  validates :address, :first_name, :last_name, :zip_code, :city, :state, presence: true
end
