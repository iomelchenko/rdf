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
		params.compact[0].to_s
	end	

	def hide(params)
		arr = params.compact
		hd = nil
		if arr.length > 1
		  hd = "hide" + arr[1].to_s
		end
		hd  
	end	

	def cust_type (obj, d_type)

	    if d_type == "DATE"
	      obj = obj.to_date.to_formatted_s(:db)
	  	end	

	  	obj

	end			

end    