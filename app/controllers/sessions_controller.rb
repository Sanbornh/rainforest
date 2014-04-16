class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	binding.pry
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id 
  		redirect_to products_url, :notice => "Logged in!"
		else
 			render "new"	
 		end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to productes_url, :notice => "Logged out!"
  end

end
