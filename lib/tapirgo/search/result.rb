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

require 'json'

module Tapirgo
  class Search
    # Tapir search result class
    #
    # @author Jonathan Hartman <j@p4nt5.com>
    class Result
      include Errors

      def initialize(result_str)
        @json = JSON.parse(result_str)
      end

      def title
        @title ||= json['title']
      end

      def score
        @score ||= json['_score']
      end

      def link
        @link ||= json['link']
      end

      def content
        @content ||= json['content']
      end

      def summary
        @summary ||= json['summary']
      end

      def published
        @published ||= json['published_on']
      end

      private

      attr_accessor :json
    end
  end
end

# vim: ai et ts=2 sts=2 sw=2 ft=ruby
