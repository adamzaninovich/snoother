#!/usr/bin/env ruby -wKU

require 'yaml'

require_relative 'lib/snoother'

api_key = YAML.load(File.read(Dir.pwd+'/config.yml'))['api_key']

search = Snoother::Search.new(api_key)
search.set_parameter(
  a: 0,     # search all wines, not just in stock
  n: 5,     # return 5 results
  t: :wine, # return only wine, no spirits
  q: "Castoro Tempranillo"
)
p search.execute(:wines)
