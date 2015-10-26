module HasExtension
  extend ActiveSupport::Concern

  included do
    alias_attribute :extension, :info3

    def display_info
      [extension ? "#{number} ext # #{extension}" : number]
    end
  end
end