class PDF < Asset
  include Searchable

  alias_attribute :path_dl, :path_link

  self.pool_fields = [:filename]
  self.db_opts = {
    display_general: [
      [:filename, :path_dl]
    ]
  }

  private

  def add_path
    update(path_dl: download_pdf_path(id))
  end

  def set_path_file(steps)
    self.path_file = Rails.root.join("public/pdfs", steps, filename)
  end
end
