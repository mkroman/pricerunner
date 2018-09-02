require_relative '../spec_helper'

RSpec.describe PriceRunner::Client do
  describe '.new' do
    let(:username) { 'user' }
    let(:password) { 'pass' }

    it 'should fail when the site is invalid' do
      expect {
        described_class.new(username, password, site: 'unk')
      }.to raise_error(PriceRunner::InvalidSiteError)
    end
  end

  describe '#get_categories' do
    subject { described_class.new(ENV['PRICERUNNER_USER'], ENV['PRICERUNNER_PASS']) }

    it 'should return a list of categories' do
      categories = subject.get_categories

      expect(categories).to be_kind_of Array
      expect(categories).to_not be_empty
      expect(categories).to all be_kind_of PriceRunner::Category
    end
  end
end
