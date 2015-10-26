class Email < Contact
  alias_attribute :address, :info1
  
  def display_info
    [address]
  end
end
