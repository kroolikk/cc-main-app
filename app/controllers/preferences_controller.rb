# -*- encoding: utf-8 -*-
class PreferencesController < AdminController

  def index
    @preferences = Preference.order("id DESC").paginate(:page => params[:page], :per_page => 100)
  end


  def show
    @preference = Preference.find(params[:id])
  end


  def new
    @preference = Preference.new
    @available_tags = most_popular_tags(@preference.tags)
  end


  def edit
    @preference = Preference.find(params[:id])
    @available_tags = most_popular_tags(@preference.tags)
  end


  def create
    @preference = Preference.new(params[:preference])

    Rails.logger.info @preference.name

    @preference.tag_list = params[:p_tags].map{|k,v| v}.join(', ') if params[:p_tags].present?
    if @preference.save
      redirect_to preferences_url, notice: 'Artykuł utworzony.'
    else
      @available_tags = most_popular_tags(@preference.tags)
      render action: "new"
    end
  end


  def update
    @preference = Preference.find(params[:id])
    @preference.tag_list = params[:p_tags].map{|k,v| v}.join(', ') if params[:p_tags].present?    
    if @preference.update_attributes(params[:preference])
      redirect_to preferences_url, notice: 'Artykuł wyedytowany.'
    else
      @available_tags = most_popular_tags(@preference.tags)
      render action: "edit"
    end
  end


  def destroy
    @preference = Preference.find(params[:id])
    @preference.destroy

    redirect_to preferences_url
  end
end
