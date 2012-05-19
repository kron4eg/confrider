require 'spec_helper'

describe 'Confrider.from_hash' do
  it 'should return Confrider::Core object' do
    Confrider.from_hash({}).should be_a Confrider::Core
  end
end
