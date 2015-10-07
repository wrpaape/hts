module StripNewlines
  extend ActiveSupport::Concern

  included do
    before_create :strip_newlines
    
    private

    def strip_newlines
      self.class.columns.each do |col|
        if col.type == :text && col.name
          strip_outer_newlines(col.name)
          strip_single_newlines(col.name)
        end
      end
    end

    def strip_outer_newlines(text)
      self[text].strip!
    end

    def strip_single_newlines(text)
      self[text].gsub!(/(?<!\n)\n(?!\n)/, " ")
    end
  end
end