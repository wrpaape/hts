class Member < ActiveRecord::Base
  include StripNewlines, SetFilename, SetKey
  has_many :contacts
end
