class Image < Asset
  scope :bg, -> { where("class_name ~* ' bg'") }
  scope :fg, -> { where.not(id: bg.select(:id))  }

  private

  def add_path
    default_filename = /bg/ === class_name ? "bg-default.png" : "default.png"

    regex = type.in?(%w(HomePageImage AboutUsImage)) ? /$/ :
    case parent_type
      when "Product", "Spec" then /(?<=\/).*/
      else /[^\/]+\/$/
    end

    update(path_default: path_file.sub(regex, default_filename))
  end

  def set_path_file(steps)
    self.path_file = steps
  end
end
