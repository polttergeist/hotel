# frozen_string_literal: true

require 'rails_helper'

describe WeatherApiRequestJob, type: :job do
  describe '#perform_later' do
    before { ActiveJob::Base.queue_adapter = :test }

    it 'will be enqueued' do
      expect do
        WeatherApiRequestJob.perform_later(1)
      end.to have_enqueued_job
    end

    it 'will generate a file' do
      WeatherApiRequestJob.perform_now
      expect(File.exist?('current_temp.txt')).to eq(true)
    end
  end
end
