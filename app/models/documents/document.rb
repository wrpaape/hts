class Document < ActiveRecord::Base
  include HasCategory

  belongs_to :parent, polymorphic: true

  self.search_db = {
    display_general: [
      {
        field: :title
        attrs: [:title, :path_show]
      }
    ],
    display_text: [
      {
        field: :body
        attrs: [:body, :title, :path_show]
      }
    ]
  }
end