namespace :util do
  desc "Pomocnicze procesy"

  task :rand_place_cat => :environment do
    puts 'start'
    Place.unscoped.all.each do |p| 
      p.update_attributes( :category_id => (rand(4)+1), :email => 'example@example.com' )
      puts "id: #{p.id}"
    end
    puts 'koniec'
  end

end