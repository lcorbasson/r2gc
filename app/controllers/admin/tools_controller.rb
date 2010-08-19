class Admin::ToolsController < ApplicationController
  only_allow_access_to :create, :edit, :update, :new, :index,
    :when => [:admin, :r2gc_correspondent, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => 'You must have designer privileges to perform this action.'
 
  
  def index
    @tools = Tool.without_deleted
  end

  def new
    @tool = Tool.new
  end

  def show
    
  end

  def update_tools
    @laboratory = Laboratory.find(params[:laboratory_id])
    render :update do |page|
      page.replace_html :linked_tools, :partial => "admin/tools/index_select", :locals => {:f => params[:form]}
      page.replace_html :correspondents, :partial => "admin/tools/select_correspondents", :locals => {:f => params[:form]}
    end
  end

  
end
