require 'spec_helper'

describe Confrider::Core do
  let(:cfg) { Confrider::Core.new.tap { |o| o.from_hash :foo => 'bar'} }

  describe '#initialize' do
    it 'should init @vault' do
      cfg.instance_variable_get('@vault').should be_a Hash
    end
  end

  describe '#from_hash' do
    let(:cfg) do
      Confrider::Core.new.tap do |o|
        o.from_hash 'foo' => {'bar' => {'baz' => 'value'}}
      end
    end

    it 'should flatten hash keys' do
      cfg['foo.bar.baz'].should == 'value'
    end

    it 'should merge nested hashes' do
      cfg.from_hash 'foo' => {'bar' => {'kii' => 'kiivalue'}}
      cfg['foo.bar.baz'].should == 'value'
      cfg['foo.bar.kii'].should == 'kiivalue'

      # hash should be merged
      cfg['foo.bar'].should include('kii' => 'kiivalue')
      cfg['foo.bar'].should include('baz' => 'value')
    end
  end

  describe '#[]' do
    it 'should return value' do
      cfg['foo'].should == 'bar'
    end

    it 'should return default value if nothing found' do
      cfg['foo2', 'default value'].should == 'default value'
    end
  end

  describe '#normalize_keys' do
    it 'should join keys with "."' do
      cfg.normalize_keys('q', 'a', 'z').should == 'q.a.z'
    end

    it 'should remove leading "."' do
      cfg.normalize_keys(nil, 'q').should == 'q'
    end
  end
end
