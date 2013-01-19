module ApplicationHelper


  def previous_calendar_params(year, month, week)
    curr_date_str = "#{year}/#{month}/#{day_from_id(week)}"
    curr_date = curr_date_str.to_date
    prev_date = curr_date - 8.day
    result = {:year => prev_date.strftime('%Y'), :month => prev_date.strftime('%m'), :week => id_from_day(prev_date.strftime('%d'))}
  end


  def next_calendar_params(year, month, week)
    curr_date_str = "#{year}/#{month}/#{day_from_id(week, false)}"
    curr_date = curr_date_str.to_date
    prev_date = curr_date + 8.day
    result = {:year => prev_date.strftime('%Y'), :month => prev_date.strftime('%m'), :week => id_from_day(prev_date.strftime('%d'))}
  end


  def day_from_id(week, pre=true)
    day = case week.to_i
    when 1 then pre ? 7 : 1
    when 2 then pre ? 15 : 9
    when 3 then pre ? 23 : 17
    when 4 then pre ? 28 : 25
    end
    day
  end


  def id_from_day(day)
    d = day.to_i
    if (1..8).to_a.include?(d)
      week = 1
    elsif (9..16).to_a.include?(d)
      week = 2
    elsif (17..24).to_a.include?(d)
      week = 3
    elsif (25..31).to_a.include?(d)
      week = 4
    end
    week
  end


  def box_size(p)
    if p.size.present? && p.size > 0
      result = p.size + 1
    else
      result = rand(3) + 2
    end
    result
  end


  def cat_id_from_param(p)
    cat = MAIN_CATEGORIES.detect{|c| c[:url_param] == p}
    if cat.present?
      id = cat[:id]
    else
      id = "0"
    end
    id    
  end


  def display_category(id)
    cat = MAIN_CATEGORIES.detect{|c| c[:id] == id}
    if cat.present?
      name = cat[:name]
    else
      name = "brak"
    end
    name
  end

  
  def cat_col(id=0)
    case id
    when 1 then 'orange'
    when 2 then 'green'
    when 3 then 'blue'
    when 4 then 'pink'
    end
  end


  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end


  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

end
