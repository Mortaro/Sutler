class Ship < ActiveRecord::Base

  sutler

  validates_presence_of :name

  def summarized_history
    history.truncate_words(8)
  end

end
