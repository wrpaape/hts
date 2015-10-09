class Pdf < Asset
  private

  def build_path(steps)
    self.path = Rails.root.join("public/pdfs", steps, filename)
  end
end
