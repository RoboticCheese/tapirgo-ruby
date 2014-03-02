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

require_relative '../../spec_helper'
require 'json'

describe Tapirgo::Search::Result do
  let(:title) { 'Star Wars Ipsum' }
  let(:score) { nil }
  let(:link) { '2014-02-22-starwars-test-ipsum.html' }
  let(:content) { "Lucas ipsum dolor sit amet organa lars kashyyk moff.\n" }
  let(:summary) { nil }
  let(:published) { '2014-02-22T02:34:00Z' }
  let(:input) do
    "{\"title\":\"#{title}\"," \
    "\"_score\":#{score || 'null'}," \
    "\"link\":\"#{link}\"," \
    "\"content\":\"#{content.gsub("\n", '\\n')}\"," \
    "\"summary\":#{summary || 'null'}," \
    "\"published_on\":\"#{published}\"}"
  end
  let(:json) { input.class == String ? JSON.parse(input) : input }
  let(:result) { Tapirgo::Search::Result.new(input) }

  describe '#initialize' do
    context 'JSON string input' do
      it 'parses and stores the JSON input' do
        expect(result.instance_variable_get(:@json)).to eq(json)
      end
    end

    context 'Hash input' do
      let(:input) do
        {
          'title' => title,
          '_score' => score,
          'link' => link,
          'content' => content,
          'summary' => summary,
          'published_on' => published
        }
      end
      it 'stores the Hash input' do
        expect(result.instance_variable_get(:@json)).to eq(input)
      end
    end
  end

  %w{title score link content summary published}.each do |i|
    describe "##{i}" do
      it "returns the result #{i}" do
        expect(result.instance_eval(i)).to eq(instance_eval(i))
      end
    end
  end

  describe '#json' do
    it 'returns the parsed JSON data' do
      expect(result.send(:json)).to eq(json)
    end
  end
end

# vim: ai et ts=2 sts=2 sw=2 ft=ruby
