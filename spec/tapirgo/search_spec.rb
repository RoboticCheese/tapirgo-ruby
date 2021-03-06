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
require 'json'

describe Tapirgo::Search do
  let(:token) { 'xyz123' }
  let(:query) { 'successful test' }
  let(:search) { Tapirgo::Search.new(token, query) }
  let(:code) { 200 }
  let(:to_s) { '[{"things": [1, 2, 3]}]' }
  let(:api_get) { double(code: code, to_s: to_s) }
  let(:json) { JSON.parse(to_s) }

  before(:each) do
    RestClient.stub(:get).and_return(api_get)
    Tapirgo::Search::Result.stub(:new) { |r| r }
  end

  describe '#initialize' do
    before(:each) { Tapirgo::Search.stub(:get).and_return(to_s) }

    it 'sets up a token instance variable' do
      expect(search.instance_variable_get(:@token)).to eq(token)
    end

    it 'sets up a query instance variable' do
      expect(search.instance_variable_get(:@query)).to eq(query)
    end

    it 'saves the set of search results' do
      expect(search.instance_variable_get(:@results)).to eq(json)
    end
  end

  describe '#[]' do
    it 'returns the result at the given index' do
      expect(search[0]).to eq(json[0])
    end
  end

  describe '#each' do
    it 'iterates over the array of search results' do
      expect(search.each { |r| r }).to eq(json)
    end
  end

  describe '#get' do
    context 'a successful HTTP get' do
      it 'returns the appropriate JSON result' do
        expect(search.send(:get)).to eq(to_s)
      end
    end

    context 'a failed HTTP get' do
      let(:code) { 500 }
      let(:to_s) { 'Well that did not work' }

      it 'raises an exception' do
        expect { search.send(:get) }.to raise_error(Tapirgo::Errors::HTTPError)
      end
    end
  end

  describe '#uri' do
    before(:each) do
      Tapirgo::Search.stub(:query).with(query).and_return('successful%20test')
    end

    it 'generates the correct URI string' do
      res = search.send(:uri)
      expect(res).to eq('http://www.tapirgo.com/api/1/search.json?' \
                        "token=xyz123&query=successful%20test")
    end
  end

  describe '#token' do
    it 'returns the Search token' do
      expect(search.send(:token)).to eq(token)
    end
  end

  describe '#query' do
    it 'returns a URI-ized copy of the original query string' do
      res = search.send(:query)
      expect(res).to eq('successful%20test')
    end
  end
end

# vim: ai et ts=2 sts=2 sw=2 ft=ruby
