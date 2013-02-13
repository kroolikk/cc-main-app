class PlacesController < AdminController

  def index
    @places = Place.select("id, category_id, slug, image, name, city, street, street_no, zip_code").paginate(:page => params[:page], :per_page => 100)
  end


  def show
    @place = Place.find(params[:id])
  end


  def new
    @place = Place.new
  end


  def edit
    @place = Place.find(params[:id])
  end


  def create
    @place = Place.new(params[:place])
    if @place.save
      redirect_to places_url, notice: 'Miejsce dodane.'
    else
      render action: "new"
    end
  end


  def update
    @place = Place.find(params[:id])
    if @place.update_attributes(params[:place])
      redirect_to places_url, notice: 'Miejsce wyedytowane.'
    else
      render action: "edit"
    end
  end


  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to places_url
  end
end
