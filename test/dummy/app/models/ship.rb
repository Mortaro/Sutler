class Ship < ActiveRecord::Base

  validates_presence_of :name

  def summarized_history
    history.truncate_words(8)
  end

end
