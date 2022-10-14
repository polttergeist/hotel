# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GenerateBookingLogsJob, type: :job do
  describe '#perform_later' do
    before { ActiveJob::Base.queue_adapter = :test }

    it 'will be enqueued' do
      expect do
        GenerateBookingLogsJob.perform_later(1)
      end.to have_enqueued_job
    end

    it 'will generate log files' do
      GenerateBookingLogsJob.perform_now
      expect(File.exist?('bookings_report.csv')).to eq(true)
      expect(File.exist?('bookings_report.xlsx')).to eq(true)
    end
  end
end
