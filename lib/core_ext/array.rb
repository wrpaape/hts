class Array
  def hash_map
    Hash[map { |el| [el, yield(el)] }]
  end
end