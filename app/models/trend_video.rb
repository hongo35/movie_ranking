class TrendVideo < ActiveRecord::Base
  self.primary_keys = :vid, :trend_date
end
