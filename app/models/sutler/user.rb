module Sutler
  class User < ActiveRecord::Base
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  end
end
