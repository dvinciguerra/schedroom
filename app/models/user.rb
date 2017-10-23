require 'schedroom/integration/gravatar_image'

class User < ApplicationRecord
  has_secure_password

  # validations
  validates :first_name,
            presence: true, length: { in: 4..40 }

  validates :last_name,
            presence: true, length: { in: 4..40 }

  validates :email,
            presence: true, uniqueness: true

  validates :password,
            presence: true, length: { in: 4..20 }

	# relationships
	has_many :room_schedules

	# build a full name using first and last name
	def name
		self.first_name + " " + self.last_name
	end

	# returns a profile avatar image path
	def profile_image(size = 42)
		Schedroom::Integration::GravatarImage.generate_path(self.email, size)
	end

end
