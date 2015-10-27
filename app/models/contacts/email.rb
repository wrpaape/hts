class Email < Contact
  alias_attribute :address, :info1
  
  def info_display
    [address]
  end
end
