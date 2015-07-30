class Comment < ActiveRecord::Base
	belongs_to :photo, dependent: :destroy
end
