class GenerateBookingLogsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    csv_string = CSV.generate do |csv|
      csv << ["Name", "Email", "Start date", "End date"]
      Booking.approved_bookings.each do |booking|
        csv << [booking.name, booking.email, booking.start_date, booking.end_date]
      end
    end
    File.open("bookings_report.csv", "w") { |file| file.write(csv_string) }

    workbook = RubyXL::Workbook.new
    worksheet = workbook.add_worksheet('Approved bookings')
    worksheet.add_cell(0, 0, 'Name')
    worksheet.add_cell(0, 1, 'Email')
    worksheet.add_cell(0, 2, 'Start date')
    worksheet.add_cell(0, 3, 'End date')
    counter = 1
    Booking.approved_bookings.each do |booking|
      worksheet.add_cell(counter, 0, booking.name)
      worksheet.add_cell(counter, 1, booking.email)
      worksheet.add_cell(counter, 2, booking.start_date.to_s)
      worksheet.add_cell(counter, 3, booking.end_date.to_s)
      counter += 1
    end
    workbook.write('bookings_report.xlsx')
  end
end
