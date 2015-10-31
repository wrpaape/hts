class ActiveRecord::Base
  def serializable_hash(options)
    options ||= {}
    if options[:include_all]
      children = [:has_one, :has_many].flat_map { |assoc| model.reflect_on_all_associations(assoc).map(&:name) }
      ids_types_timestamps = model.column_names.grep(/_id|_type|_at/).map(&:to_sym) << :id
      options = options.merge(include: children, except: ids_types_timestamps).compact
    end

    super(options)
  end
end