class ActiveRecord::Base
  before_create :set_key, :strip_newlines

  def serializable_hash(options)
    options ||= {}
    if options[:include_all]
      children = [:has_one, :has_many].flat_map { |assoc| self.class.reflect_on_all_associations(assoc).map(&:name) }
      ids_types_timestamps = self.class.column_names.grep(/_id|_type|_at/).map(&:to_sym) << :id
      options = options.merge(include: children, except: ids_types_timestamps).compact
    end

    super(options)
  end

  protected

  def set_key
    self.key = "#{self.class.to_s.underscore}-#{self.class.count}" if respond_to?(:key) && !key
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
    self[text].try(:tr!, "/(?<!\n)\n(?!\n)/", " ")
  end
end