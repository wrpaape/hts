[Product, Document].each do |top_level|
  top_level.descendants.each do |desc|
    desc.pool_fields -= [:category]
    desc.top_level = false
  end
end
