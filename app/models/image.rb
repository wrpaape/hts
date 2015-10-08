class Image < Asset
  before_create :set_filename

  private

  def set_filename
    filename.prepend("#{parent.name.sub(" ", "_")}-") 
  end
end
