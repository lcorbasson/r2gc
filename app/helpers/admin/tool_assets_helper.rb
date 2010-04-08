module Admin::ToolAssetsHelper


  def new_public_photo_link(tool)
    case tool
      when Software
        new_admin_software_tool_public_photo_path(tool)
      when  ToolEngine
        new_admin_tool_engine_tool_public_photo_path(tool)
      when TestEngine
        new_admin_test_engine_tool_public_photo_path(tool)
      when MeasuringEngine
        new_admin_measuring_engine_tool_public_photo_path(tool)
    end
  end

  def new_private_photo_link(tool)
    case tool
      when Software
        new_admin_software_tool_privatec_photo_path(tool)
      when  ToolEngine
        new_admin_tool_engine_tool_private_photo_path(tool)
      when TestEngine
        new_admin_test_engine_tool_private_photo_path(tool)
      when MeasuringEngine
        new_admin_measuring_engine_tool_private_photo_path(tool)
    end
  end

  def new_brochure_link(tool)
    case tool
      when Software
        new_admin_software_brochure_path(tool)
      when  ToolEngine
        new_admin_tool_engine_brochure_path(tool)
      when TestEngine
        new_admin_test_engine_brochure_path(tool)
      when MeasuringEngine
        new_admin_measuring_engine_brochure_path(tool)
    end
  end

  def new_schema_link(tool)
    case tool
      when Software
        new_admin_software_schema_path(tool)
      when  ToolEngine
        new_admin_tool_engine_schema_path(tool)
      when TestEngine
        new_admin_test_engine_schema_path(tool)
      when MeasuringEngine
        new_admin_measuring_engine_schema_path(tool)
    end
  end

  def edit_schema_link(tool, schema)
    case tool
      when Software
        edit_admin_software_schema_path(tool, schema)
      when  ToolEngine
        edit_admin_tool_engine_schema_path(tool, schema)
      when TestEngine
        edit_admin_test_engine_schema_path(tool, schema)
      when MeasuringEngine
        edit_admin_measuring_engine_schema_path(tool, schema)
    end
  end

  def edit_brochure_link(tool, brochure)
    case tool
      when Software
        edit_admin_software_brochure_path(tool, brochure)
      when  ToolEngine
        edit_admin_tool_engine_brochure_path(tool, brochure)
      when TestEngine
        edit_admin_test_engine_brochure_path(tool, brochure)
      when MeasuringEngine
        edit_admin_measuring_engine_brochure_path(tool, brochure)
    end
  end

  def edit_private_photo_link(tool, tool_private_photo)
    case tool
      when Software
        edit_admin_software_tool_private_photo_path(tool, tool_private_photo)
      when  ToolEngine
        edit_admin_tool_engine_tool_private_photo_path(tool, tool_private_photo)
      when TestEngine
        edit_admin_test_engine_tool_private_photo_path(tool, tool_private_photo)
      when MeasuringEngine
        edit_admin_measuring_engine_tool_private_photo_path(tool, tool_private_photo)
    end
  end

  def edit_public_photo_link(tool, tool_public_photo)
    case tool
      when Software
        edit_admin_software_tool_public_photo_path(tool, tool_public_photo)
      when  ToolEngine
        edit_admin_tool_engine_tool_public_photo_path(tool, tool_public_photo)
      when TestEngine
        edit_admin_test_engine_tool_public_photo_path(tool, tool_public_photo)
      when MeasuringEngine
        edit_admin_measuring_engine_tool_public_photo_path(tool, tool_public_photo)
    end
  end

   def destroy_public_photo_link(tool, tool_public_photo)
    case tool
      when Software
        admin_software_tool_public_photo_path(tool, tool_public_photo)
      when  ToolEngine
       admin_tool_engine_tool_public_photo_path(tool, tool_public_photo)
      when TestEngine
        admin_test_engine_tool_public_photo_path(tool, tool_public_photo)
      when MeasuringEngine
        admin_measuring_engine_tool_public_photo_path(tool, tool_public_photo)
    end
  end

   def destroy_private_photo_link(tool, tool_private_photo)
    case tool
      when Software
        admin_software_tool_private_photo_path(tool, tool_private_photo)
      when  ToolEngine
       admin_tool_engine_tool_private_photo_path(tool, tool_private_photo)
      when TestEngine
        admin_test_engine_tool_private_photo_path(tool, tool_private_photo)
      when MeasuringEngine
        admin_measuring_engine_tool_private_photo_path(tool, tool_private_photo)
    end
  end

   def destroy_brochure_link(tool, brochure)
    case tool
      when Software
        admin_software_brochure_path(tool, brochure)
      when  ToolEngine
       admin_tool_engine_brochure_path(tool, brochure)
      when TestEngine
        admin_test_engine_brochure_path(tool, brochure)
      when MeasuringEngine
        admin_measuring_engine_brochure_path(tool, brochure)
    end
  end

   def destroy_schema_link(tool, schema)
    case tool
      when Software
        admin_software_schema_path(tool, schema)
      when  ToolEngine
       admin_tool_engine_schema_path(tool, schema)
      when TestEngine
        admin_test_engine_schema_path(tool, schema)
      when MeasuringEngine
        admin_measuring_engine_schema_path(tool, schema)
    end
  end
end