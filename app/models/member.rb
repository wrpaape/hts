class Member < ActiveRecord::Base
  before_create :strip_outer_newlines,
    :strip_single_newlines
  has_many :contacts

  private

  def strip_outer_newlines
    bio.strip!
  end

  def strip_single_newlines
    bio.gsub!(/(?<!\n)\n(?!\n)/, " ")
  end
end
