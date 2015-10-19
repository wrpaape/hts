class String
  def titleize!
    replace titleize
  end

  def fileize
    tr("/\\-/", "▓").underscore.tr("/▓/", "-").tr("/ /", "_")
  end
end