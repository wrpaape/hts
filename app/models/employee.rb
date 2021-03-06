class Employee < ActiveRecord::Base
  include AddImage, AddPath, Searchable, Contactable

  before_save :titleize_names, :set_full_name

  has_one :office_phone, as: :parent
  has_one :mobile_phone, as: :parent

  alias_attribute :name, :full_name
  alias_attribute :head_shot, :image

  self.image_type = HeadShot
  self.db_opts = {
    display_labeled: [
      [:full_name, :job_title, :path_show],
      [:job_title, :full_name, :path_show]
    ]
  }

  def name_display
    "#{name} (#{job_title})"
  end

  private

  def all_names
    [first_name, middle_name, last_name].compact
  end

  def titleize_namesz
    all_names.each(&:titleize!)
  end

  def set_full_name
    self.full_name = all_names.join(" ")
  end
end
