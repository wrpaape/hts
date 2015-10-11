class Pdf < Asset
  private

  def add_path
    update(path_alt: download_pdf_path(id))
  end

  def set_path_file(steps)
    self.path_file = Rails.root.join("public/pdfs", steps, filename)
  end
end
