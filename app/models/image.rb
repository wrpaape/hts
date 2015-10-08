class Image < Asset
  before_create :set_filename

  private

  def set_filename
    prefix = parent.try(:name) || parent.try(:title)
    filename.prepend("#{prefix.downcase.sub(" ", "_")}-") if prefix
  end
end
