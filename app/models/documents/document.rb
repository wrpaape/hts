class Document < ActiveRecord::Base
  include HasCategory

  belongs_to :parent, polymorphic: true

  self.db_opts = {
    display_general: [
      [:title, :path_show],
    ],
    display_text: [
      [:body, :title, :path_show],
    ]
  }
end