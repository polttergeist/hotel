class Admin::FilesController < ApplicationController
  def download
    respond_to do |format|
      format.csv do
        send_file(
          "#{Rails.root}/bookings_report.csv",
          filename: "bookings_report.csv",
          type: "application/csv"
        )
      end

      format.xlsx do
        send_file(
          "#{Rails.root}/bookings_report.xlsx",
          filename: "bookings_report.xlsx",
          type: "application/xlsx"
        )
      end
    end
  end
end
