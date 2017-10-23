require 'spec_helper'
require 'timecop'

RSpec.describe Schedroom::Date do
  context '#days_of_week' do
    # fix time to 2017-10-18
    before { Timecop.freeze(Time.local(2017, 10, 18, 12, 0, 0)) }

    # return time
    after { Timecop.return }

    let(:days_of_week) do
      Schedroom::Date.days_of_week(Date.today.cweek)
    end

    # is wednesday?
    it 'checks if today is wednesday' do
      expect(Date.today.wednesday?).to be true
    end

    it 'tests if days_of_week returns right dates' do
      expect(days_of_week.map(&:day)).to include(16..20)
    end

    it 'tests if days_of_week returns business days only' do
      days = days_of_week.select { |d| d.saturday? || d.sunday? }
      expect(days.size).to be 0
    end
  end
end
