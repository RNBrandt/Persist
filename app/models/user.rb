class User < ApplicationRecord
  has_many :documents
  before_save :set_civic_json
  validates :address, :first_name, :last_name, :zip_code, :email, :city, :state, presence: true
  private

  def set_civic_json
    request = "https://www.googleapis.com/civicinfo/v2/representatives?key=#{ENV['GOOGLE_CIVIC_API_KEY']}  &address=#{self.address}"
    response = HTTParty.get(request)
    self.civic_json = response
  end

end

