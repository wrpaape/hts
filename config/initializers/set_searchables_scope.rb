[Product, Document].each do |top_level|
  top_level.descendants.each do |desc|
    desc.top_level = false
    desc.search_category = false
  end
end
