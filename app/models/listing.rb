class Listing < ApplicationRecord
	belongs_to :user
	enum verification: [:not_verified, :verified]
	mount_uploaders :avatars, AvatarUploader
	has_many :reservations

	def self.search(search)
  where("property_type LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%") 
end

end
