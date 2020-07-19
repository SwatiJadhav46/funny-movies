class SharedVideo < ApplicationRecord
  belongs_to :user

  validates :title, :url, :provider, :video_id, presence: true

  default_scope { order(created_at: :desc) }

  def duration_in_hms
    "%02d:%02d:%02d hr" % [duration / 3600, duration / 60 % 60, duration % 60]
  end

  def shared_on
    created_at.strftime("%d %B %Y, %I:%M %p")
  end
end
