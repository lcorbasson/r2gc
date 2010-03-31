# Uncomment this if you reference any of your controllers in activate
 require_dependency 'application_controller'


class R2gcExtension < Radiant::Extension
  version "1.0"
  description "Provides equipment gestion tool and roles managements."
  url "https://github.com/uneek/R2GC"

  define_routes do |map|
    map.namespace(:admin)  do |admin|
      admin.resources :tools
      admin.resources :softwares
      admin.resources :test_engines
      admin.resources :measuring_engines
      admin.resources :tool_engines 
      admin.resources :laboratories
      admin.resources :agencies
      admin.resources :use_conditions
      admin.resources :software_application_domains
      admin.resources :software_statuses
      admin.resources :correspondents
      admin.resources :r2gc_users
      admin.resources :teams
      admin.resources :roles#, :member => {:users => :get, :remove_user => :delete, :add_user => :post}
      admin.role_user '/roles/:role_id/users/:id', :controller => 'roles', :action => 'remove_user', :conditions => {:method => :delete}
      admin.role_user '/roles/:role_id/users/:id', :controller => 'roles', :action => 'add_user', :conditions => {:method => :post}
      admin.role_users '/roles/:role_id/users', :controller => 'roles', :action => 'users', :conditions => {:method => :get}
    end
    map.resources :tools
    map.resources :softwares
    map.resources :test_enginesls
    map.resources :measuring_engine
    map.resources :tool_engines
    map.resources :test_engines
    map.resources :databases, :collection => {:login =>:any}    
    map.rbac 'admin/rbac', :controller => 'admin/roles', :action => 'index'
    map.role_details 'admin/roles/:id', :controller => 'admin/roles', :action => 'show'
  end

  def activate
     #add Radiant Render
     SiteController.send :include, SiteControllerExtension   

      tab 'Equipements' do
         add_item("Logiciels", "/admin/softwares")
         add_item("Domaines d'application logiciel", "/admin/software_application_domains")
         add_item("Statuts logiciel", "/admin/software_statuses")
         add_item("Machines outil", "/admin/tool_engines")
         add_item("Moyens d'essai", "/admin/test_engines")
         add_item("Moyen de mesure et d'analyse", "/admin/measuring_engines")
         add_item("Conditions d'utilisation", "/admin/use_conditions")
      end

      tab 'Laboratoires - Organismes' do
         add_item("Laboratoires", "/admin/laboratories")
         add_item("Organismes", "/admin/agencies")
      end

      tab 'Utilisateurs' do
        add_item("Equipes", "/admin/teams")
        add_item("Correspondants", "/admin/correspondents")
        add_item("Utilisateurs R2GC", "/admin/r2gc_users")
      end

      Radiant::Config['roles.admin.sees_everything'] = 'true' unless Radiant::Config['roles.admin.sees_everything']
      if Role.table_exists?
        admin.tabs.add "Roles", "/admin/roles", :after => "Layouts", :visibility => [:admin]
        User.send :has_and_belongs_to_many, :roles
        User.send :include, RolesSupport
        User.class_eval do
          define_method("can_update_tool?") do |*args|
            tool = *args
            (r2gc_correspondent? && Correspondent.find(id).tools.include?(tool)) || admin?
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
