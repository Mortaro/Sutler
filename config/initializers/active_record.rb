class ActiveRecord::Base
  def self.sutler
    default_scope { order("'#{table_name}'.'order' ASC, created_at DESC") }
  end
end
