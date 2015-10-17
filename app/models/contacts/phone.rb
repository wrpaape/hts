class Phone < Contact
  alias_attribute :number, :info1
  alias_attribute :area_code, :info2
end
