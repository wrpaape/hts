class Contact < ActiveRecord::Base
  before_create :set_display_type

  belongs_to :parent, polymorphic: true

  scope :by_priority, -> { order(primary: :desc) }
  scope :by_display, -> { by_priority.order(type: :desc) }
  scope :primary, -> { where(primary: true) }

  private

  def set_display_type
    self.display_type = type.underscore.dasherize
  end
end
