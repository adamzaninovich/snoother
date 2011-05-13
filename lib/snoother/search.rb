module Snoother
  
  class Search
    attr_reader :response

    def initialize(akey=MY_API_KEY, ip='0.0.0.0', format=:json)
      @akey = akey
      @ip = ip
      @format = format
      @parameters = Hash.new
      @username = ''
      @password = ''
    end

    def set_parameter params
      # Search

      # method: wine (id is required)
      # id    - The unique code for the requested wine.
      # i     - Inventory. Set this to 1 to return price information for the requested wine.
      # c     - Country. Limits price data to wines available in this country.
      # z     - Zip Code. When combined with certain countries this will return local results.
      # lat   - Latitude. When combined with longitude this will return local results.
      # lng   - Longitude. When combined with latitude this will return local results.
      # lang  - Language. Return winery supplied content (Winemaker's Notes, Vintage Notes, etc) in the specified language. Possible values: en, el, fr, de, it, pt, es. (Beta)

      # method: wines
      # q     - Your search.
      # f     - The first result to return. Default: 1
      # n     - Number of results. Possible values are 1-1000. Default: 10.
      # t     - Product type. Possible values are 'wine' or 'spirits'. Leave blank to include results for both wines and spirits.
      # m     - Store ID. Limits results to wines available from this store. Will cause location-based parameters to be ignored.
      # c     - Country. Limits results to wines available in this country. (List of supported countries)
      # z     - Zip Code. When combined with certain countries this will return local results.
      # lat   - Latitude. When combined with a longitude value, will return local results. If a Country parameter is included, this parameter will be ignored.
      # lng   - Longitude. When combined with a latitude value, will return local results. If a Country parameter is included, this parameter will be ignored.
      # s     - Sort. Possible values are sr (SnoothRank), price+asc, price+desc, qpr (Quality Price Ratio), vintage+asc, vintage+desc. Leave blank for recommended sort.
      # mp    - Minimum price. Possible values are in full US dollars.
      # xp    - Maximum price. Possible values are in full US dollars.
      # a     - Available. Set this to 0 to return all wines, or 1 to return wines in stock. Default: 1.
      # lang  - Language. Only return wines with content in the specified language. Possible values: en, el, fr, de, it, pt, es. (Beta)

      @parameters.merge(params)
    end

    def set_authentication username, password
      @username = username
      @password = password
    end

    def reset_parameters
      @parameters = Hash.new
    end

    def execute method
      unless method.empty?
        return send(SNOOTH_BASE_URL + '/' + method.to_s + '/')
      end
      return false
    end

    private
    def send url
      parameters = {akey: @akey, ip: @ip, format: @format}.merge(@parameters)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host,uri.port)
      request = Net::HTTP::Post.new(uri.request_uri)
      request.set_form_data(parameters) unless parameters.empty?
      begin
        response = http.request(request)
        return JSON.parse(response.body)
      rescue Net::HTTPError => e
        return false
      end
    end

  end
  
end