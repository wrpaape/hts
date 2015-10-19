class Asset < ActiveRecord::Base
  include AddPath

  before_create :set_filename, :build_path_file
  belongs_to :parent, polymorphic: true

  private

  def set_filename
    prefix = parent.try(:name) || parent.try(:title) || try(:caption)
    filename.prepend("#{prefix.fileize}-") if prefix
  end

  def build_path_file
    return if path_file
    steps = "" 
    ancestor = self
    while ancestor.respond_to?(:parent)
      ancestor = ancestor.parent
      steps.prepend("#{ancestor.class.to_s.fileize.pluralize}/")
    end

    steps.sub!(/\//, "/#{ancestor.name.fileize}/")

    ancestor = ancestor.class
    until ancestor.superclass == ActiveRecord::Base
      ancestor = ancestor.superclass
      steps.prepend("#{ancestor.to_s.fileize.pluralize}/")
    end
    
    set_path_file(steps)
  end
end