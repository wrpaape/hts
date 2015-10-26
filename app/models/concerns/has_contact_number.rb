module HasContactNumber
  extend ActiveSupport::Concern

  included do
    before_create :set_area_code

    alias_attribute :number, :info1
    alias_attribute :area_code, :info2

    def display
      number
    end

    private

    def set_area_code
      self.area_code = number.scan(/\d{3}/).first unless area_code
    end
  end
end