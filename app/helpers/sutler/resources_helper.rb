module Sutler
  module ResourcesHelper

    def resources_list
      Dir["#{Rails.root}/app/sutler/*.yml"].map {|file| File.basename(file, '.*')}
    end

    def form_resource_path resource
      resource.new_record? ? resources_path(params[:resource]) : edit_resource_path(params[:resource], @resource)
    end

    def inputable_attributes
      resource_schema.select { |attr, options| !options[:input].blank? }
    end

    def indexable_attributes
      resource_schema.select { |attr, options| !options[:index].blank? }
    end

  end
end
