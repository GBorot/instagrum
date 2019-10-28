class Post < ApplicationRecord
  default_scope { order created_at: :desc }
  mount_uploader :photo, PhotoUploader
  belongs_to :account

  has_many :likes

  before_create :set_active

  scope :active, -> { where active: true }

  def total_likes
    likes.count
  end

  def liked?(account)
    likes.any? { |like| like.account_id == account.id }
  end

  private

  def set_active
    self.active = true
  end
end
