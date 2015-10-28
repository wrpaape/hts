class String
  def titleize(options = {})
    exclusions = options[:exclude]

    return ActiveSupport::Inflector.titleize(self) unless exclusions.present?
    self.underscore.humanize.gsub(/\b(?<!['’`])(?!(#{exclusions.join('|')})\b)[a-z]/) { $&.capitalize }
  end
  
  def titleize!
    replace titleize
  end

  def fileize
    tr("/\\-/", "▓").underscore.tr("/▓/", "-").tr("/ /", "_")
  end

  def escape_regex
    pattern = /(\'|\"|\.|\*|\/|\-|\\|\)|\$|\+|\(|\^|\?|\!|\~|\`)/
    gsub(pattern) { |match| "\\#{match}" }
  end
end