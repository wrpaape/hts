class DownloadsController < ApplicationController
  def pdf
    pdf = PDF.find(params[:id])
    send_file(pdf.path_file, filename: pdf.filename, type: "application/pdf")
  end
end