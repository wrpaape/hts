# class ActiveRecord::Base
  # private

  # def self.search(exclude_text, input, output)
  #   search_opts.tap { |opts|  opts.pop if exclude_text }.each do |opt|
  #     search_db(input, opt[:field], opt[:attrs]).each do |result|
  #       output.push({
  #         key: "result-#{output.length}",
  #         input: input,
  #         path: result.pop,
  #         display: send(opt[:display], input, *result)
  #       })
  #     end
  #   end
  # end

#   def serializable_hash(options)
#     options ||= {}
#     if options[:include_all]
#       children = [:has_one, :has_many].flat_map { |assoc| model.reflect_on_all_associations(assoc).map(&:name) }
#       ids_types_timestamps = model.column_names.grep(/_id|_type|_at/).map(&:to_sym) << :id
#       options = options.merge(include: children, except: ids_types_timestamps).compact
#     end

#     super options
#   end
# end