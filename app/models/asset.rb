class Asset < ActiveRecord::Base
  before_create :set_filename, :set_path
  belongs_to :parent, polymorphic: true

  private

  def set_filename
    prefix = parent.try(:name) || parent.try(:title)
    filename.prepend("#{prefix.downcase.gsub(/\s/, "_")}-") if prefix
  end

  def set_path
    steps = ""
    ancestor = self
    while ancestor.respond_to?(:parent)
      ancestor = ancestor.parent
      steps.prepend("#{ancestor.class.to_s.underscore.pluralize}/")
    end

    steps.sub!(/\//, "/#{ancestor.name.downcase.gsub(/\s/, "_")}/")

    ancestor = ancestor.class
    until ancestor.superclass == ActiveRecord::Base
      ancestor = ancestor.superclass
      steps.prepend("#{ancestor.to_s.underscore.pluralize}/")
    end
    
    build_path(steps)
  end
end