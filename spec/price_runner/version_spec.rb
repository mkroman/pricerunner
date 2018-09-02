require_relative '../spec_helper'

RSpec.describe PriceRunner::VERSION do
  it 'should be a string' do
    expect(subject).to be_kind_of String
  end
end
