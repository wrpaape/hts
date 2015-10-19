class Image < Asset
  private

  def add_path
    regex =
    case parent_type
      when "Product", "Spec" then /(?<=\/).*/
      else /[^\/]+\/$/
    end

    update(path_default: path_file.sub(regex, "default.png"))
  end

  def set_path_file(steps)
    self.path_file = steps
  end
end
