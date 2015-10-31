module BaseCallbacks
  extend ActiveSupport::Concern

  included do
    before_create :set_key, :set_class_name, :strip_newlines

    private

    def set_key
      self.key = "#{model.dasherized}-#{model.count}" if respond_to?(:key) && !key
    end

    def set_class_name
      self.class_name = model.dasherized
    end

    def strip_newlines
      self.class.columns.each do |col|
        if col.type == :text && col.name
          strip_outer_newlines(col.name)
          strip_single_newlines(col.name)
        end
      end
    end

    def strip_outer_newlines(text)
      self[text].try(:strip!)
    end

    def strip_single_newlines(text)
      self[text].try(:gsub!, "/(?<!\n)\n(?!\n)/", " ")
    end
  end
end