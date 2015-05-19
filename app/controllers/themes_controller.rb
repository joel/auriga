class ThemesController < ApplicationController

   def setting
     session[:theme] = params[:theme]
     current_user.update theme: params[:theme] if current_user
     redirect_to :back
   end

end
