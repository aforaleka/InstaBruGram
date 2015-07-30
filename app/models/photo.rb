class Photo < ActiveRecord::Base
	belongs_to :user, dependent: :destroy
	has_many :comments
	validates :image, presence: true

   	def liked!
		if self.likes == nil
			story = self
			story.likes = 0
			story.save
		else
			story = self
			story.likes = story.likes + 1
			story.save
		end
	end

end
