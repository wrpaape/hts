class Asset < ActiveRecord::Base
  before_create :set_path
  belongs_to :parent, polymorphic: true

  private

  def set_path
    steps = ""
    parent_class = parent.class
    while parent_class != ActiveRecord::Base
      steps.prepend("#{parent_class.to_s.underscore.pluralize}/")
      parent_class = parent_class.superclass
    end
    self.path = type == "Image" ? steps : Rails.root.join("public/assets", steps, filename)
  end
end