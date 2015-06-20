class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_one :summary
  belongs_to :topic
  has_one :summary

  default_scope { order('created_at DESC') }
end
