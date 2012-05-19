require 'spec_helper'

describe Confrider::Core do
  let(:cfg) { Confrider::Core.new :foo => 'bar' }

  context '#initialize' do
    it 'should init @vault' do
      cfg.instance_variable_get('@vault').should be
    end
  end

  context '#save_hash' do
    let(:cfg) { Confrider::Core.new 'foo' => {'bar' => {'baz' => 'value'}} }

    it 'should flatten hash keys' do
      cfg['foo.bar.baz'].should == 'value'
    end
  end

  context '#[]' do
    it 'should return value' do
      cfg['foo'].should == 'bar'
    end

    it 'should return default value if nothing found' do
      cfg['foo2', 'default value'].should == 'default value'
    end
  end

  context '#normalize_keys' do
    it 'should join keys with "."' do
      cfg.normalize_keys('q', 'a', 'z').should == 'q.a.z'
    end

    it 'should remove leading "."' do
      cfg.normalize_keys(nil, 'q').should == 'q'
    end
  end
end
