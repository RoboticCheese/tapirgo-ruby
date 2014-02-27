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

module Tapirgo
  module Errors
    # Exception class for HTTP Tapir errors
    #
    # @author Jonathan Hartman <j@p4nt5.com>
    class HTTPError < StandardError
      def initialize(response)
        super("Request failed with code #{response.code}: #{response.to_s}")
      end
    end
  end
end

# vim: ai et ts=2 sts=2 sw=2 ft=ruby
