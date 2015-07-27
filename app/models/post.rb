class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one :summary
  belongs_to :topic
  has_many :votes
  has_one :image
  has_many :favorites, dependent: :destroy

  mount_uploader :image, ImagePostUploader
  default_scope { order('rank DESC') }

  def save_with_initial_vote
    ActiveRecord::Base.transaction do
      user.votes.create(value: 1, post: self)
    end
  end

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970, 1, 1)) / (60 * 60 * 24)
    new_rank = points + age_in_days

    update_attribute(:rank, new_rank)
  end

  def create_vote
    user.votes.create(value: 1, post: self)
  end

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true
end
