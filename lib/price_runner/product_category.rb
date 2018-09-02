# frozen_string_literal: true

module PriceRunner
  # ProductCategory is a sub-category for products.
  class ProductCategory < Category
    # @return [Bool] whether this is a hybrid category
    attr_accessor :hybrid
    # @return [Bool] whether this is a browsable category
    attr_accessor :browsable
    # @return [Bool] whether this is FreeText
    attr_accessor :free_text
    # @return [Bool] whether this is external
    attr_accessor :external

    def self.from_element(element)
    end
  end
end
