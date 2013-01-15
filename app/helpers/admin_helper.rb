# -*- encoding: utf-8 -*-
module AdminHelper

  def display_post_size(size)
    result = case size
    when 0 then "losowo"
    when 1 then "mały"
    when 2 then "średni"
    when 3 then "duży"
    end
    result
  end

end
