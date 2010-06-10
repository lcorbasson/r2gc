class HelpsController < SiteController

  def index
    radiant_render :page => "/tools/help_tools"
  end

   def download
      head(:bad_request) and return unless params[:to_format]
      path =  "#{RAILS_ROOT}/public/documents/aide_base_de donnees_mode_consultation.#{params[:to_format]}"

      send_file path, :type => File.mime_type?(path), :disposition => 'inline'
    end
end
