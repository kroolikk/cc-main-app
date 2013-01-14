# encoding: UTF-8

module MyHelpers

end


class Array
  def test
    'test - ok'
  end

  def sql_prepared_ids(id=nil)
    rps = self
    result = ''
    result += 'id != '+id.to_s if id .present?
    rps.each do |rp|
      result += ' AND ' if result.present?
      ret = case rp.class.to_s
      when 'Fixnum' then  
        rp.to_s
      when 'String' then 
        rp
      when 'Hash' then 
        rp.first
      when 'Array' then
        rp.first
      else
        rp.id.to_s
      end
      result += 'id != '+ret
    end
    return result
  end
end