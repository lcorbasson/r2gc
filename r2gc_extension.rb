# Uncomment this if you reference any of your controllers in activate
 require_dependency 'application_controller'

class R2gcExtension < Radiant::Extension
  version "1.0"
  description "Provides equipment gestion tool."
  url "https://github.com/uneek/R2GC"

  define_routes do |map|
    map.namespace(:admin)  do |admin|
      admin.resources :tools
      admin.resources :softwares
      admin.resources :test_engines
      admin.resources :measuring_engine
      admin.resources :tool_engines
      admin.resources :consumers
      admin.resources :laboratories
      admin.resources :agencies
      admin.resources :use_conditions
      admin.resources :software_application_domains
      admin.resources :software_statuses
    end
  end

  def activate
   tab 'Base de données équipements' do
     add_item("Equipements", "/admin/tools")
     add_item("Correspondants", "/admin/consumers")
     add_item("Laboratoires", "/admin/laboratories")
     add_item("Organismes", "/admin/agencies")
     add_item("Conditions d'utilisation", "/admin/use_conditions")
     add_item("Domaines d'application logiciel", "/admin/software_application_domains")
     add_item("Statuts logiciel", "/admin/software_statuses")
   end

    #add Radiant Render
    SiteController.send :include, SiteControllerExtension

  end



end
