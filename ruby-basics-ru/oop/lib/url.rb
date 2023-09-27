# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

class Url
  attr_reader :url

  extend Forwardable
  include Comparable

  def initialize(url)
    @url = URI(url)
    @query_params_hash = create_hash_query
  end

  def_delegators :@url, :scheme, :host, :port

  def query_params
    @query_params_hash
  end

  def query_param(key, default_value = nil)
    if @query_params_hash.keys.include?(key)
      @query_params_hash[key]
    else
      default_value
    end
  end

  def ==(other)
    my_url = @url.to_s
    obj_url = other.url.to_s
    my_url.chars.sort == obj_url.chars.sort
  end

  private

  def create_hash_query
    str = @url.query
    if !str.nil?
      str.split('&').map do |h|
        hs = h.split('=')
        Hash[hs[0].to_sym, hs[1]]
      end.inject({}) { |s, h| s.merge(h) }
    else
      {}
    end
  end
end

# END
