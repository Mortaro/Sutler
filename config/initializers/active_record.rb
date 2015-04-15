class ActiveRecord::Base
  def self.sutler
    default_scope { order("'#{table_name}'.'position' ASC, created_at DESC") }
  end
end
