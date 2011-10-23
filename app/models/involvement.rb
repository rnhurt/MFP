class Involvement < ActiveRecord::Base
  belongs_to  :contact #,  :foreign_key => 'involved_id'
  belongs_to  :report
  # belongs_to  :role#,    :foreign_key => 'role_id'
end
