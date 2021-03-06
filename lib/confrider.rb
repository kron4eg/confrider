require 'confrider/version'
require 'confrider/vault'
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
