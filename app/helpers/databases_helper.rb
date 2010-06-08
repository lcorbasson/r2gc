module DatabasesHelper
  
   def find_last_update
    Tool.find(:first, :order => "updated_at DESC").updated_at       
  end
end
