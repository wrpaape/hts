class DownloadController < ApplicationController
  def pdf
    pdf = Pdf.find(params[:id])
    send_file(pdf.path_file, filename: pdf.filename, type: "application/pdf")
  end
end