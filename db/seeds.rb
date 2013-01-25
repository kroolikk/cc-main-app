# -*- encoding: utf-8 -*-

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


if false # posts seeds
  amount = 70
  amount.times do |i|
    post = Post.new({ :title => "artykuł #{i}", 
      :description => DESCRIPTION_EXAMPLE,
      :start_date => Time.now.to_s(:db),
      :category_id => rand(4)+1,
      :lead => "#{i} Sed laoreet luctus dictum. Duis ipsum mi, convallis eget posuere convallis, facilisis a dui.",
      :place_id => Place.order("RAND()").first.id,
      :is_event => 1,
      :event_start => (Time.now - (amount/2).to_i.day + i.day),
      :author => "Anonymous"})
    post.save                 

    4.times do |j|
      photo = Photo.new({ :post_id => post.id, 
        :title => "artykuł #{i} - zdjęcie #{j}", 
        :photo => File.open(File.join(Rails.root, "/public/test_photos/photo_#{rand(9)}.jpg")) })
      photo.save                  
    end

    puts "#{i} - post_id: #{post.id}"
  end
end

"50.114194,19.821688 ----------  50.009945,20.127245"
if true # places seeds
  amount = 1000
  amount.times do |i|
    place = Place.new({
                      :name => "place #{i}",
                      :city => 'city_xxx',
                      :street => 'street_xxx',
                      :street_no => '17',
                      :zip_code => 'XX-XXX',
                      :detect_coords => false,
                      :latitude => Place.random_coord(50.114194, 50.009945),
                      :longitude => Place.random_coord(19.821688, 20.127245),
                      :description => DESCRIPTION_EXAMPLE,
                      :phone => 'XXX XXX XXX',
                      :website => 'http://www.xxxxx.com',
                      :opening_hours => '15:00 - 24:00',
                      :info => 'info info info',
                      :image => File.open(File.join(Rails.root, "/public/test_photos/photo_#{rand(9)}.jpg")) 
                      })
    place.save
  end


end