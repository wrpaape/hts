class Email < Contact
  alias_attribute :address, :info1
  
  def display
    address
  end
end
