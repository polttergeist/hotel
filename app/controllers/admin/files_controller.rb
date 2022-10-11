# frozen_string_literal: true

module Admin
  class FilesController < ApplicationController
    def download
      respond_to do |format|
        format.csv do
          respond_with_file('csv')
        end

        format.xlsx do
          respond_with_file('xlsx')
        end
      end
    end

    private

    def respond_with_file(format)
      send_file(
        "#{Rails.root}/bookings_report.#{format}",
        filename: "bookings_report.#{format}",
        type: "application/#{format}"
      )
    end
  end
end
