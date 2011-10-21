class Offense < Code
  default_scope { where(:state_id => StaticData.state_id) }
end
