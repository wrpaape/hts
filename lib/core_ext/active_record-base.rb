class ActiveRecord::Base
  def serializable_hash(options = nil)
    options = options.try(:clone) || {}
    children = [:has_one, :has_many].flat_map { |assoc| self.class.reflect_on_all_associations(assoc).map(&:name) }
    ids_timestamps = self.class.column_names.grep(/_id|_at/).map(&:to_sym) << :id

    super options.merge(include: children, except: ids_timestamps)
  end
end