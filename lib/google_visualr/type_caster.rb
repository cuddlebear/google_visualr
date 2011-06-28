module GoogleVisualr

  module TypeCaster

    # If the column type is 'string'    , the value should be a string.
    # If the column type is 'number'    , the value should be a number.
    # If the column type is 'boolean'   , the value should be a boolean.
    # If the column type is 'date'      , the value should be a Date object.
    # If the column type is 'datetime'  , the value should be a DateTime or Time object.
    # If the column type is 'timeofday' , the value should be an array of three or four numbers: [hour, minute, second, optional milliseconds].
    # Returns 'null' when value is nil'
    def typecast(value)
      case
        when value.is_a?(String)
          return "'#{value.gsub(/[']/, '\\\\\'')}'"
        when value.is_a?(Integer)   || value.is_a?(Float)
          return value
        when value.is_a?(TrueClass) || value.is_a?(FalseClass)
          return "#{value}"
        when value.is_a?(Date)
          return "new Date(#{value.year}, #{value.month-1}, #{value.day})"
        when value.is_a?(DateTime)  ||  value.is_a?(Time)
          return "new Date(#{value.year}, #{value.month-1}, #{value.day}, #{value.hour}, #{value.min}, #{value.sec})"
        when value.nil?
          return "null"
        else
          return value
      end
    end

    def stringify_keys!(options)
      options.keys.each do |key|
        options[key.to_s] = options.delete(key)
      end
      options
    end

  end

end