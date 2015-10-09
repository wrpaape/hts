module Search
  extend ActiveSupport::Concern

  ALL = {
    products: {
      name: {
        results: ->(input) { Product.where("LOWER(name) LIKE (?)", "%#{input.downcase}%").pluck(:type, :id, :name) },
        link: ->(result) { eval("#{result[0].underscore}_path(#{result[1]})") },
        display: ->(result) { result[2] }
      },
      type: {
        results: ->(input) { %w(products modifications).grep(Regexp.new(input, "i")) },
        link: ->(result) { eval("#{result}_path") },
        display: ->(result) { result }
      },
      info: {
        results: ->(input) { input.pluck(:type, :id, :info, :name).uniq },
        link: ->(result) { eval("#{result[0].underscore}_path(#{result[1]})") },
        display: ->(result) { "...#{result[2]}... (#{result[3]})" }
      }
    },
    Member: [
      {

      }
    ]
  }

    Member: [:name, :title],
    Pdf: [:filename]
  ]

  def self.query(pool = ALL, value)
    pool 
  end

  def query(value)

  end
end

Product.where("name LIKE (?)", "%#{first_name}%")