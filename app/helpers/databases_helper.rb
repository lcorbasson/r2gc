module DatabasesHelper
  
   def find_last_update
    max_update = Tool.find(:first, :order => "updated_at ASC").updated_at
    max_create = Tool.find(:first, :order => "created_at ASC").created_at
    max_update > max_create ? max_update : max_create
  end
end
