class Cab < ActiveRecord::Base
	
	def self.bookcab(pick_up,drop_point,type)
		pick_up=pick_up.downcase
		drop_point=drop_point.downcase
		type=type.downcase
		date=DateTime.now
		checkpickup = Location.select("longitude ,latitude").where("place=?",pick_up)
		checkdroppoint = Location.select("longitude ,latitude").where("place=?",drop_point)
		if checkpickup.empty?
            return 0

        elsif checkdroppoint.empty?
        	return 1
        else 
        	freecabs=Cab.where("cab_type=? and end_time<?",type,date)
        	if freecabs.empty?
        		return 2
        	else
        		
        		min=nil
        		finaldata=nil
                freecabs.each  do |t|
                	temp=Math.hypot((t.cab_longitude-checkpickup[0].longitude),(t.cab_latitude-checkpickup[0].latitude))
                	if min == nil
                		min=temp
                		finaldata=t
                	elsif min>temp
                		min=temp
                        finaldata=t
                	else 


                	end


                end
                new_endtime=date+min.minutes
                finaldata.end_time=new_endtime
                finaldata.save
        	    return finaldata
            end 
        end
         
     
    end
end
