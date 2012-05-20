class Confrider::Core
  def initialize
    @vault = {}
  end

  def [](key, default_value = nil)
    @vault.fetch(key, default_value)
  end

  def from_hash(hash)
    save_hash(nil, hash)
  end

  def normalize_keys(*keys)
    keys.join('.').gsub(/^\./, '')
  end

  private

  def save(key, value)
    @vault[key] = value
  end

  def save_hash(key, hash)
    @vault[key] = hash if key
    hash.each do |inner_key, value|
      normalized_key = normalize_keys(key, inner_key)
      case value
        when Hash then save_hash(normalized_key, value)
        else save(normalized_key, value)
      end
    end
  end
end
