module DigestParserValidator

  # Invalidates index if missing or empty, taking advantage of lazy eval
  def valid_index?(item, index)
    item.has_key?(index) and !item[index].nil? and !item[index].empty?
  end

  # Validate an index for given hash
  def validate_index(item, index)
    unless valid_index?(item, index)
      raise "Missing digest field #{index.capitalize}"
    end
  end

  # Validates multiple indices for given hash
  def validate_indices(item, indices)
    indices.each do |index|
      validate_index(item, index)
    end
  end

end
