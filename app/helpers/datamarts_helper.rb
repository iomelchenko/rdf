module DatamartsHelper

	def dm_row
		str = ''
		max = DmStructure.where(measure: 0).maximum('level_order').to_i
		max.downto(1) do |i|
           str += "#{"datamart[:level_" + i.to_s + "_id], "}"
		end	
		str.chomp(", ")
		str

	end

	def data_hidden(params)
		str = ''
		params.compact.each do |i|
           str += i.to_int.to_s + '_'
		end	
		str.chomp("_")
	end	

	def hide(params)
		arr = params.compact
		hd = ''
		if arr.length > 1
		  hd = "hide"
		  arr.pop
		  arr.each do |i|
	           hd += i.to_s + '_'
		  end	
		end
		hd.chomp("_") 
	end	

	def cust_type (obj, d_type)

	    if d_type == "DATE"
	      #obj = obj.to_date.to_formatted_s(:db)
	      obj = obj.to_date
	  	end	

	  	obj

	end			

end    