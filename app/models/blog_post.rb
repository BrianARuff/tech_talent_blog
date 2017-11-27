class BlogPost < ApplicationRecord
	validates :title, :blog_entry, presence: true
	validates :title, length: {maximum: 140, too_short: "Post cannot exceed 140 characters"}
	has_many :comments, dependent: :destroy #depdent destroy will delete comments with post deletion
end
