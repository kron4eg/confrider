require 'confrider/version'
require 'confrider/core'

module Confrider
  def self.from_hash(hash)
    Confrider::Core.new hash
  end
end
