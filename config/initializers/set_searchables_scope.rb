[Product, Document].each do |top_level|
  top_level.descendants.each do |desc|
    [:top_level=, :search_categories=].each do |attr|
      desc.send(attr, false)
    end
  end
end
