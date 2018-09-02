# frozen_string_literal: true

module PriceRunner
  class Client
    HEADERS = {
      'User-Agent' => 'Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19'
    }

    def initialize(username, password, site: 'se')
      @username = username
      @password = password

      unless @feed_url = PriceRunner.get_feed_url(site)
        valid_sites = FEED_URLS.map{|k, v| k}.join(', ')

        raise InvalidSiteError, "unsupported site: #{site} - valid sites: " \
          "#{valid_sites}"
      end

      @http = Net::HTTP.new(@feed_url.host, @feed_url.port)
      @http.use_ssl = true if @feed_url.scheme == 'https'
    end

    def get_product(product_id)

    end

    def get_categories
      url = URI.join(@feed_url, '/Feed.jsp?f=PricerunnerCatTree')

      request = Net::HTTP::Get.new(url, HEADERS)
      request.basic_auth(@username, @password)

      response = @http.request(request)
      document = Nokogiri::XML(response.body)

      document.xpath('/Categories/Category').map do |category_element|
        Category.from_element(category_element)
      end
    end
  end
end
