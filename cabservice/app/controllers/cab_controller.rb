class CabController < ApplicationController

  def index
   
  end
  def book
   @pick_up = params[:pick_up]
   @drop_point = params[:drop_point]
   @type = params[:type]
   
  if (@type.present? && @drop_point.present? && @pick_up.present?)
           @query=1
           @list=Cab.bookcab(@pick_up,@drop_point,@type)
  else
           flash[:notice] = "All Feilds are mandatory. Please enter all the feilds"
            redirect_to root_url
  end
            
   
  end
end
