class Url < ApplicationRecord
  validates :url, presence: true
  MAX_RESULTS = 100

  scope :top_visits,-> { order('visits DESC').limit(MAX_RESULTS) }

  def increment_visits
    self.increment(:visits, 1)
    self.save!
  end

  def set_short_url
    self.short_url = UrlsHelper.bijective_encode(id)
  end
end
