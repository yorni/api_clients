class ApiKey < ActiveRecord::Base
  belongs_to :acc_system
  before_create :generate_authentication_token

    def generate_authentication_token
      loop do
        self.key = SecureRandom.base64(64)
        break unless ApiKey.find_by(key: key)
      end
    end
end
