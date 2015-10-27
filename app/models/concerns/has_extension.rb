module HasExtension
  extend ActiveSupport::Concern

  included do
    alias_attribute :extension, :info3

    def info_display
      [extension ? "#{number} ext # #{extension}" : number]
    end
  end
end