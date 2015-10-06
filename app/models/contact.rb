class Contact < ActiveRecord::Base
  belongs_to :member

  private

  def self.inheritance_column
    nil
  end
end
