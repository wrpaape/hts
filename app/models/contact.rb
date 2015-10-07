class Contact < ActiveRecord::Base
  belongs_to :member

  private

  self.inheritance_column = :_type_disabled
end
