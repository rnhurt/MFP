class Offense < Code
	has_many	:reports

  default_scope { where(:state_id => StaticData.state_id) }
end
