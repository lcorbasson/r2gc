# Uncomment this if you reference any of your controllers in activate
 require_dependency 'application_controller'


class R2gcExtension < Radiant::Extension
  version "1.0"
  description "Provides equipment gestion tool and roles managements."
  url "https://github.com/uneek/R2GC"

  define_routes do |map|
    map.root :controller => "databases"
    map.namespace(:admin)  do |admin|
      admin.resources :tools, :collection => { :update_tools => :get } do |tool|
        tool.resources :tool_assets
        tool.resources :tool_public_photos
        tool.resources :tool_private_photos
        tool.resources :tool_brochures
        tool.resources :tool_schemas
      end
      admin.resources :softwares do |software|
        software.resources :tool_assets
        software.resources :tool_public_photos
        software.resources :tool_private_photos
        software.resources :tool_brochures
        software.resources :tool_schemas
      end
      admin.resources :test_engines do |test_engine|
        test_engine.resources :tool_assets
        test_engine.resources :tool_public_photos
        test_engine.resources :tool_private_photos
        test_engine.resources :tool_brochures
        test_engine.resources :tool_schemas
      end
      admin.resources :measuring_engines do |measuring_engine|
        measuring_engine.resources :tool_assets
        measuring_engine.resources :tool_public_photos
        measuring_engine.resources :tool_private_photos
        measuring_engine.resources :tool_brochures
        measuring_engine.resources :tool_schemas
      end
      admin.resources :tool_engines do |tool_engine|
        tool_engine.resources :tool_assets
        tool_engine.resources :tool_public_photos
        tool_engine.resources :tool_private_photos
        tool_engine.resources :tool_brochures
        tool_engine.resources :tool_schemas
      end
      admin.resources :laboratories
      admin.resources :tool_subtypes
      admin.resources :calibrations
      admin.resources :agencies
      admin.resources :use_conditions
      admin.resources :software_application_domains
      admin.resources :software_statuses
      admin.resources :correspondents
      admin.resources :r2gc_users
      admin.resources :r2gc_managers
      admin.resources :search_entities
      admin.resources :search_subentities
     # admin.resources :r2gc_statics, :collection => { :modify_home => :any, :update_home => :post }
      admin.resources :roles#, :member => {:users => :get, :remove_user => :delete, :add_user => :post}
      admin.role_user '/roles/:role_id/users/:id', :controller => 'roles', :action => 'remove_user', :conditions => {:method => :delete}
      admin.role_user '/roles/:role_id/users/:id', :controller => 'roles', :action => 'add_user', :conditions => {:method => :post}
      admin.role_users '/roles/:role_id/users', :controller => 'roles', :action => 'users', :conditions => {:method => :get}
    end
    map.resources :tool_public_photos, :member => {:download => :any}
    map.resources :tool_private_photos, :member => {:download => :any}
    map.resources :tool_brochures, :member => {:download => :any}
    map.resources :tool_schemas, :member => {:download => :any}
    map.resources :tools, :collection => {:get_information => :get, :send_informations_mail => :post}
    map.resources :softwares, :member => {:to_pdf => :get}
    map.resources :measuring_engines, :member => {:to_pdf => :get}
    map.resources :tool_engines, :member => {:to_pdf => :get}
    map.resources :test_engines, :member => {:to_pdf => :get}
    map.resources :databases, :collection => {:login =>:any}    
    map.rbac 'admin/rbac', :controller => 'admin/roles', :action => 'index'
    map.role_details 'admin/roles/:id', :controller => 'admin/roles', :action => 'show'



    map.connect '/public/system/tool_schemas/assets/:asset_id/:style', :controller => 'tool_schemas', :action => 'download'
  end

  def activate
     #add Radiant Render
     SiteController.send :include, SiteControllerExtension

     

      tab 'Equipements' do
         add_item("Logiciels", "/admin/softwares")        
         add_item("Machines-outil", "/admin/tool_engines")
         add_item("Moyens d'essai", "/admin/test_engines")
         add_item("Moyen de mesure et d'analyse", "/admin/measuring_engines")        
      end

      tab 'Laboratoires - Entités de recherche' do
         add_item("Laboratoires", "/admin/laboratories")
         add_item("Entités de recherche", "/admin/search_entities")
         add_item("Sous entités", "/admin/search_subentities")
      end

      tab 'Paramètres' do
        add_item("Domaines d'application logiciel", "/admin/software_application_domains")
        add_item("Statuts logiciel", "/admin/software_statuses")
        add_item("Conditions d'utilisation", "/admin/use_conditions")
        add_item("Etalonnage/Calibration/Verification", "/admin/calibrations")
        add_item("Sous types", "/admin/tool_subtypes")
      end  


      tab 'Utilisateurs' do
        add_item("Correspondants", "/admin/correspondents")
        add_item("Utilisateurs laboratoires", "/admin/r2gc_users")
        add_item("Modérateurs", "/admin/r2gc_managers")
      end      

      Radiant::Config['roles.admin.sees_everything'] = 'true' unless Radiant::Config['roles.admin.sees_everything']
      if Role.table_exists?
        admin.tabs.add "Roles", "/admin/roles", :after => "Layouts", :visibility => [:admin]
        User.send :has_and_belongs_to_many, :roles
        User.send :include, RolesSupport
        User.class_eval do
          define_method("can_update_tool?") do |*args|
            tool = *args
            (r2gc_correspondent? && Correspondent.find(id).tools.include?(tool)) || admin? || r2gc_manager?
          end
        end
        admin.users.edit[:form].delete('edit_roles')
        UserActionObserver.instance.send :add_observer!, Role
      end
      Admin::UsersController.class_eval {
        helper Admin::AlterationsHelper
      }
  end



end
