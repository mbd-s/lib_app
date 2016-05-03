class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    render :index
  end

  def new
    @library = Library.new
    render :new
  end

  def create
    library_params = params.require(:library).permit(:name, :floor_count, :floor_area)
    @library = Library.create(library_params)
    redirect_to libraries_path
  end

  def show
    library_id = params[:id]
    @library = Library.find_by_id(library_id)
      render :show
  end

  def edit
    library_id = params[:id]
    @library = Library.find_by_id(library_id)
    render :edit
  end

  def update
    library_id = params[:id]
    @library = Library.find_by_id(library_id)
    library_params = params.require(:library).permit(:name, :floor_count, :floor_area)
    @library.update_attributes(library_params)
    redirect_to library_path(@library)
  end

  def destroy
    library_id = params[:id]
    @library = Library.find_by_id(library_id)
    @library.destroy
    redirect_to libraries_path
  end

end
