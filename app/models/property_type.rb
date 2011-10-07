class PropertyType < Code
  default_scope { where(:region_code => StaticData.region_code) }
end
