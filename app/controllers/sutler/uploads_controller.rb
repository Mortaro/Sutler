require_dependency "sutler/application_controller"

module Sutler
  class UploadsController < ApplicationController

    before_action :authenticate_user!

    def create
      @upload = Upload.create do |upload|
        upload.data = params[:upload].read
        upload.filename = params[:upload].original_filename
        upload.mime_type = params[:upload].content_type
      end
      render json: {files: [{url: @upload.url}]}
    end

    def show
      @upload = Upload.find(params[:id])
      send_data @upload.data, type: @upload.mime_type, disposition: 'inline'
    end

    def destroy
      @upload = Upload.find(params[:id])
      render json: @upload.destroy
    end

  end
end
