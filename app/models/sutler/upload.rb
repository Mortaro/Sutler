module Sutler
  class Upload < ActiveRecord::Base
    def url
      "/sutler/uploads/#{id}/#{filename.split('.').first.parameterize.gsub('_', '-')}.#{mime_type.split('/').last}"
    end
  end
end
