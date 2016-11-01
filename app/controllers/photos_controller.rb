class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def  show

    @photo = Photo.find_by({ :id => params[:id]})

  end

  def new_form
  end

  def create_row
    p = Photo.new
    p.caption = params[:the_caption]
    p.source = params[:the_source]
    p.save

    #render("creat_row.html.erb")
    redirect_to("http://localhost:3000/photos")
  end

  def edit_form
    #@photo = Photo.find_by({ :id => params[:id]})
    @photo = Photo.find(params[:id])
  end


def update_row
  @photo = Photo.find({ :id => params[:id]})
  #    @director = Director.find(params[:id])
  @photo.caption = params[":the_caption_new"]
    # @director.dob = params[":dob"]
  @photo.source = params[:the_source_new]
  @photo.save

  render("show")
end

  def delete
      i = Photo.find_by({ :id => params[:id]})
      i.destroy
      @list_of_photos = Photo.all
      redirect_to ("http://localhost:3000/photos/")
    end

end
