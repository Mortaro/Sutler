require_dependency "sutler/application_controller"

module Sutler
  class ResourcesController < ApplicationController

    before_action :authenticate_user!

    def root
      redirect_to resources_path(resources_list.first)
    end

    def index
      @resources = resource_model.all
    end

    def new
      @resource = resource_model.new
    end

    def create
      @resource = resource_model.new resource_params
      if @resource.save
        redirect_to resources_path, notice: 'Resource has been successfully created!'
      else
        render :new, warning: 'Resource failed to be created!'
      end
    end

    def edit
      @resource = resource_model.find params[:id]
    end

    def update
      @resource = resource_model.find params[:id]
      if @resource.update_attributes resource_params
        redirect_to resources_path, notice: 'Resource has been successfully updated!'
      else
        render :edit, warning: 'Resource failed to be updated!'
      end
    end

    def destroy
      @resource = resource_model.find params[:id]
      @resource.destroy
      redirect_to resources_path, notice: 'Resource has been successfully deleted!'
    end

    def resources_list
      Dir["#{Rails.root}/app/sutler/*.yml"].map {|file| File.basename(file, '.*')}
    end
    helper_method :resourcs_list

    def resource_model
      params[:resource].singularize.camelize.constantize
    end

    def resource_params
      params.require(params[:resource].singularize.to_sym).permit(*resource_schema.keys)
    end

    def resource_schema
      schema_file = "#{Rails.root}/app/sutler/#{params[:resource]}.yml"
      schema = YAML.load(File.read(schema_file)).with_indifferent_access[:attributes] rescue {}
    end
    helper_method :resource_schema

  end
end
