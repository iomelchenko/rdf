module SourceFieldsHelper

	def dtype(type, length, precigion, scale)
        ret = type
		if type == 'VARCHAR2'
           ret = type + '(' + length + ')'
        elsif type == 'NUMBER' and precigion != ' '
           ret = type + '(' + precigion + ',' + scale +')' 
      
        end   

        ret

	end	

end    