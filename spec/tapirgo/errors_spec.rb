# -*- encoding: utf-8 -*-
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

require_relative '../spec_helper'

describe Tapirgo::Errors::HTTPError do
  describe '#initialize' do
    let(:code) { 500 }
    let(:to_s) { 'OH NOES' }
    let(:response) { double(code: code, to_s: to_s) }
    let(:http_error) { Tapirgo::Errors::HTTPError.new(response) }

    it 'generates a correct error string' do
      expect(http_error.to_s).to eq('Request failed with code 500: OH NOES')
    end
  end
end

# vim: ai et ts=2 sts=2 sw=2 ft=ruby
