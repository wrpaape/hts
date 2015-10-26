class Phone < Contact
  include HasContactNumber

  class_attribute :display_type
end
