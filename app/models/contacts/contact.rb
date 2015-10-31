class Contact < ActiveRecord::Base
  belongs_to :parent, polymorphic: true

  scope :by_priority, -> { order(primary: :desc) }
  scope :by_display, -> { by_priority.order(type: :desc) }
  scope :primary, -> { where(primary: true) }
end
