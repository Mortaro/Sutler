module Sutler
  class ApplicationController < ActionController::Base

    protected

    def authenticate_user!
      redirect_to sutler.new_user_session_path unless user_signed_in?
    end

  end
end
