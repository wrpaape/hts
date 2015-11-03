class Array
  def hash_map
    Hash[map { |el| [el, yield(el)] }]
  end

  def append_result(input, path, display)
    push({
      key: "result-#{length}",
      input: input,
      path: path,
      display: display
    })
    throw :limit_reached if length > 4
  end
end