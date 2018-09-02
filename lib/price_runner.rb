# frozen_string_literal: true

require 'uri'
require 'net/http'

require 'nokogiri'

require 'price_runner/version'
require 'price_runner/client'
require 'price_runner/category'
require 'price_runner/product_category'

module PriceRunner
  FEED_URLS = {
    'at' => 'http://feedpartnerat.pricerunner.at',
    'dk' => 'http://feedpartnerdk.pricerunner.dk',
    'fr' => 'http://feedpartnerfr.pricerunner.fr',
    'de' => 'http://feedpartnerde.pricerunner.de',
    'se' => 'http://feedpartnerse.pricerunner.se',
    'uk' => 'http://feedpartner.pricerunner.com'
  }

  # Indicates that the requested site does not exist.
  class InvalidSiteError < StandardError; end

  # @return [String, nil] the feed url for a given country name or nil if it
  #   doesn't exist
  def self.get_feed_url(site)
    if url = FEED_URLS[site]
      URI.parse(url)
    end
  end
end
