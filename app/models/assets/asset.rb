class Asset < ActiveRecord::Base
  include AddPath

  before_create :set_filename_prefix, :build_path_file, :set_class_name
  belongs_to :parent, polymorphic: true

  private

  def set_filename_prefix
    prefix = parent.try(:name) || parent.try(:title) || try(:caption)
    filename.prepend("#{prefix.fileize}-")
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

  def set_class_name
    self.class_name = type.fileize.dasherize
  end
end