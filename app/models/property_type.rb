class PropertyType < Code
  default_scope { where(:state_id => StaticData.state_id) }
end
