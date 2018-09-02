# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe PriceRunner::Category do

  let(:category_fixture) do
    File.read(File.join(__dir__, '../fixtures/category.xml'))
  end

  describe '.from_element' do
    let(:element) { Nokogiri::XML(category_fixture).root }
    subject { PriceRunner::Category.from_element(element) }

    it 'should return a category' do
      expect(subject).to be_kind_of PriceRunner::Category
    end

    it 'should have a name' do
      expect(subject.name).to eq 'Ljud och Bild'
    end

    it 'should have a url' do
      expect(subject.url).to eq '/t/1/Ljud-och-Bild'
    end

    it 'should have subcategories' do
      expect(subject.sub_categories).to be_kind_of Array
      expect(subject.sub_categories).to_not be_empty
      expect(subject.sub_categories.count).to be > 2
    end

    it 'should not have immediate product categories'

    it 'should have a subcategory with product categories in it'
  end
end
