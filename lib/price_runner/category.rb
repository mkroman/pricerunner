# frozen_string_literal: true

module PriceRunner
  class Category
    # @return [Numeric] the category id
    attr_accessor :id

    # @return [String] the category name
    attr_accessor :name

    # @return [String] the relative category url
    attr_accessor :url

    # @return [Array<Category>] a list of subcategories, if any.
    attr_accessor :sub_categories

    # @return [Array<ProductCategory>] a list of product categories, if any.
    attr_accessor :product_categories

    def initialize(id, name, url)
      @id = id
      @name = name
      @url = url
      @sub_categories = []
      @product_categories = []
    end

    def self.from_element(element)
      id = element.at_xpath('ID')&.text
      name = element.at_xpath('Name')&.text
      url = element.at_xpath('Url')&.text

      Category.new(id, name, url).tap do |cat|
        cat.sub_categories = element.xpath('Category').map do |subcat|
          Category.from_element(subcat)
        end

        cat.product_categories = element.xpath('ProductCategory').map do |prodcat|
          ProductCategory.from_element(prodcat)
        end
      end
    end
  end
end
