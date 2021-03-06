# Encoding: UTF-8
#
# Author:: Jonathan Hartman (<j@p4nt5.com>)
#
# Copyright (C) 2014, Jonathan Hartman
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'rest-client'
require 'uri'
require 'tapirgo/search/result'

module Tapirgo
  # Tapir search class
  #
  # @author Jonathan Hartman <j@p4nt5.com>
  class Search
    include Enumerable
    include Tapirgo::Errors

    def initialize(token, query_str)
      @token = token
      @query = query_str
      @results = JSON.parse(get).map { |r| Search::Result.new(r) }
      self
    end

    def [](index)
      results[index]
    end

    def each
      results.each { |r| yield(r) }
    end

    private

    attr_reader :token
    attr_reader :results

    def get
      response = RestClient.get(uri, accept: :json)
      response.code == 200 || fail(HTTPError, response)
      response.to_s
    end

    def uri
      "http://www.tapirgo.com/api/1/search.json?token=#{token}&query=#{query}"
    end

    def query
      URI.escape(@query)
    end
  end
end

# vim: ai et ts=2 sts=2 sw=2 ft=ruby
