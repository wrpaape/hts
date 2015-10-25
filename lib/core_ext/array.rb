class Array
  def hash_map(key = :itself)
    Hash[map { |el| [el.send(key), yield(el)] }]
  end
end