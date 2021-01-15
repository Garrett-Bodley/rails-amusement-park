class UsersController < ApplicationController
#layout "admin" if user.admin

    def new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to users_new_path
        end
    end


    def show
        redirect_if_not_logged_in
     
    

    end


   

end
