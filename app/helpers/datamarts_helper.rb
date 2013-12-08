module DatamartsHelper

	def data_hidden(*params)
		params.compact[0].to_s
	end	

	def hide(*params)
		arr = params.compact
		hd = nil
		if arr.length > 1
		  hd = "hide" + arr.compact[1].to_s
		end
		hd  
	end		

end    