class Asset < ActiveRecord::Base
  before_create :bridge_paths
  belongs_to :parent, polymorphic: true

  private

  def bridge_paths
    [:path, :default].each do |path_end|
      step1 = type == "Pdf" ? "public/assets" : "app/assets/images"
      step2 = parent_type.underscore.pluralize
      self[path_end] = "#{Rails.root}/#{step1}/#{step2}/#{path_end}"
    end
  end
end