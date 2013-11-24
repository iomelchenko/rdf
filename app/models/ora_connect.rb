class OraConnect < ActiveRecord::Base

  establish_connection 'ora_report'
  self.abstract_class = true


end