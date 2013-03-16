class FrontPlacesController < ApplicationController
  
  include ApplicationHelper
  require 'will_paginate/array'

  def index
    @curr_cat = (params[:category].present? ? params[:category] : 'all')
    render :layout => "map"
  end


  def add_places_to_map
    if params[:category].present?
      @all_places = Place.find_by_sql(" SELECT  p.id,
                                                p.name,
                                                p.city,
                                                p.street,
                                                p.street_no,
                                                p.zip_code,
                                                p.latitude,
                                                p.longitude,
                                                p.slug,
                                                p.category_id
                                        FROM places p                                        
                                        WHERE p.category_id = #{cat_id_from_param(params[:category])}
                                  ;").uniq
    else
      @all_places = Place.find_by_sql(" SELECT  p.id,
                                                p.name,
                                                p.city,
                                                p.street,
                                                p.street_no,
                                                p.zip_code,
                                                p.latitude,
                                                p.longitude,
                                                p.slug,
                                                p.category_id
                                                FROM places p
                                      ;").uniq
    end
    @places = @all_places.to_a.paginate(:page => params[:page], :per_page => 99)

    @curr_cat = (params[:category].present? ? params[:category] : 'all')

    respond_to do |format|
      format.js
    end
  end


  def show
    @place = Place.find(params[:id])
    @promoted_posts = recommended_posts(4)
  end
  

end
