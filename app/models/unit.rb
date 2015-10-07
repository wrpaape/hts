class Unit < ActiveRecord::Base
  include StripNewlines, SetFilename, SetKey
end
