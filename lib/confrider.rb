require 'confrider/version'
# don't load confrider/deep_merge if it was already loaded from active_support
require 'confrider/deep_merge' unless {}.respond_to? :deep_merge
require 'confrider/core'

module Confrider
  def self.from_hash(hash)
    Confrider::Core.new.tap do |o|
      o.from_hash hash
    end
  end
end

def Confrider(hash)
  Confrider.from_hash(hash)
end
