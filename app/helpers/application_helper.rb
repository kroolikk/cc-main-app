module ApplicationHelper


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
