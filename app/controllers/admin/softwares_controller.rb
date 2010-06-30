class Admin::SoftwaresController < ApplicationController
  only_allow_access_to :create, :edit, :update, :new, :index,
    :when => [:admin, :r2gc_correspondent, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => "Vous n'avez pas les droits."
 

  def index
     @search = Software.search(params[:search])
    @tools = @search.paginate(:all,:page => params[:page], :per_page => 5000, :order => "name ASC")
  end

  def show
    @software = Software.find(params[:id])
  end

  def new
    @software = Software.new
  end

  def create
    @software = Software.new(params[:software])  
    if @software.save
      if params[:software][:main_correspondent_id]
        existing_relation = CorrespondentTool.find(:first,
          :conditions => { :tool_id => @software.id, :main => true })
        existing_relation.destroy if existing_relation
        unless params[:software][:main_correspondent_id].blank?
          CorrespondentTool.create!(
            :tool => @software,
            :correspondent_id => params[:software][:main_correspondent_id],
            :main => true
          )
        end
      end
      @software.secondary_correspondent_tools.delete_all
      if params[:software][:secondary_correspondent_ids].size>0
        params[:software][:secondary_correspondent_ids].each do |correspondent_id|
          CorrespondentTool.create!(
            :tool => @software,
            :correspondent_id => correspondent_id,
            :main => false
          )
        end
      end
      if params[:software][:linked_tools]
        params[:software][:linked_tools].each do |tool_id|
          ToolRelation.create!(
            :tool_from => @software,
            :tool_to => Tool.find(tool_id)
          )
        end
      end   
      flash[:notice] = 'Logiciel enregistré.'
      redirect_to admin_softwares_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      render :action => :new
    end
  end

  def edit
    @software = Software.find(params[:id]) 
    
  end

  def update
    @software = Software.find(params[:id])
    
    if @software.update_attributes(params[:software])
      unless params[:software][:main_correspondent_id].blank?
        existing_relation = CorrespondentTool.find(:first, 
          :conditions => { :tool_id => @software.id, :main => true })
        existing_relation.destroy if existing_relation
        unless params[:software][:main_correspondent_id].blank?
          CorrespondentTool.create!(
            :tool => @software,
            :correspondent_id => params[:software][:main_correspondent_id],
            :main => true
          )
        end
      end
      @software.secondary_correspondent_tools.delete_all
      if params[:software][:secondary_correspondent_ids].size>0
        params[:software][:secondary_correspondent_ids].each do |correspondent_id|
          CorrespondentTool.create!(
            :tool => @software,
            :correspondent_id => correspondent_id,
            :main => false
          )
        end
      end

      
      @software.relations_from.delete_all
      @software.relations_to.delete_all      
      if params[:software][:linked_tools]
        params[:software][:linked_tools].each do |tool_id|          
          ToolRelation.create!(
            :tool_from => @software,
            :tool_to => Tool.find(tool_id)
          )
        end
      end     
      flash[:notice] = 'Logiciel enregistré.'
      redirect_to admin_softwares_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end


  def destroy
    @software = Software.find(params[:id])
    if @software.destroy
      flash[:notice] = 'Logiciel supprimé.'
      redirect_to admin_softwares_path()
    else
      flash[:error] = "Une erreur s'est produite lors de la suppression."
      redirect_to :back
    end
  end

  def update_tools
    @laboratory = Laboratory.find(params[:laboratory_id]) if !params[:laboratory_id].blank?
    @software = Software.find(params[:tool_id])  if !params[:tool_id].blank?
    render :update do |page|
      page.replace_html :linked_tools, :partial => "admin/softwares/select_linked_tools"
      page.replace_html :correspondents, :partial => "admin/softwares/select_correspondents"
      page.replace_html :main_correspondent, :partial => "admin/softwares/select_main_correspondent"
    end
  end

  
end
