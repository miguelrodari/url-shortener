class Url < ApplicationRecord
  MAX_RESULTS = 100

  def self.get_top_visits
    Url.order('visits DESC').limit(MAX_RESULTS)
  end

  def increment_visits
    self.increment(:visits, 1)
    self.save!
  end
end
