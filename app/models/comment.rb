class Comment < ApplicationRecord
	belongs_to :blog_post
	validates :comment_entry, :blog_post_id, :author, presence: true
end
