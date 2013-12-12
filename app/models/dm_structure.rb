class DmStructure < OraConnect

  set_table_name 'dm_structure'

  def self.ord
     str = ''
     DmStructure.where(measure: 0).each do |i|
       str += "LEVEL_#{i.level_order.to_i}_ID, "
     end
     str.chomp(", ")	
  end	

end