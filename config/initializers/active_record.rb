class ActiveRecord::Base
  def self.sutler
    default_scope { order("position ASC, created_at DESC") }
  end
end
