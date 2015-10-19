class Asset < ActiveRecord::Base
  include AddPath

  before_create :set_filename_prefix, :build_path_file, :add_class_name
  belongs_to :parent, polymorphic: true

  alias_attribute :link, :path_link

  private

  def set_filename_prefix
    prefix = parent.try(:name) || parent.try(:title)
    filename.prepend("#{prefix.underscore.tr("/ /", "_")}-") if prefix
  end

  def build_path_file
    steps = ""
    ancestor = self
    while ancestor.respond_to?(:parent)
      ancestor = ancestor.parent
      steps.prepend("#{ancestor.class.to_s.underscore.pluralize}/")
    end

    steps.sub!(/\//, "/#{ancestor.name.underscore.tr("/ /", "_")}/")

    ancestor = ancestor.class
    until ancestor.superclass == ActiveRecord::Base
      ancestor = ancestor.superclass
      steps.prepend("#{ancestor.to_s.underscore.pluralize}/")
    end
    
    set_path_file(steps)
  end

  def add_class_name
    self.class_name = type.underscore
  end
end