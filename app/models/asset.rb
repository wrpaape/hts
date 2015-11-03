class Asset < ActiveRecord::Base
  include AddPath

  before_create :set_filename_prefix, :build_path_file, :set_class_name
  belongs_to :parent, polymorphic: true

  private

  def set_filename_prefix
    prefix = parent.try(:name) || parent.try(:title) || try(:description)
    filename.prepend("#{prefix.fileize}-")
  end

  def build_path_file
    return if path_file
    steps = ""
    ancestor = parent
    steps.prepend("#{ancestor.class.tableized}/") while ancestor.try(:parent_id) && ancestor = ancestor.parent

    steps.sub!(/\//, "/#{(ancestor.try(:name) || ancestor.try(:title)).fileize}/")

    ancestor = ancestor.class
    until ancestor == ActiveRecord::Base
      steps.prepend("#{ancestor.tableized}/")
      ancestor = ancestor.superclass
    end
      
    set_path_file(steps)
  end

  def set_class_name
    class_name.prepend("#{model.dasherized}#{class_name.present? ? " " : ""}")
  end
end