class LibraryUsersController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @libraries = @user.libraries

    render :index
  end

  def create
    @library = Library.find(params[:library_id])
    @library.users.push(current_user)

    redirect_to current_user
  end

end
