class FrontPlacesController < ApplicationController
  include ApplicationHelper
  require 'will_paginate/array'

  def index
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
                                                po.category_id AS category_id
                                        FROM places p
                                        JOIN posts po ON po.place_id = p.id
                                        WHERE po.category_id = #{cat_id_from_param(params[:category])}
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
                                                ( SELECT category_id 
                                                  FROM posts po 
                                                  WHERE po.place_id = p.id
                                                  ORDER BY id DESC
                                                  LIMIT 1 ) AS category_id
                                                FROM places p
                                      ;").uniq
    end
    @places = @all_places.to_a.paginate(:page => params[:page], :per_page => 99)
  end

  def show
    @place = Place.find(params[:id])
  end
  

end
