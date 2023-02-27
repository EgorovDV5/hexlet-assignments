require 'forwardable'
require 'uri'
# frozen_string_literal: true

# BEGIN
class Url
  extend Forwardable
  include Comparable

  attr_reader :address
  
  def initialize(url)
    @address = URI(url)
    @params = set_params(@address)
  end
  
  def_delegators :address, :scheme, :host, :port

  def query_params()
    @params
  end

  def query_param(key, value = nil)
    @params.fetch(key, value)
  end

  def <=>(url2)
    [scheme, host, port, query_params] <=> [url2.scheme, url2.host, url2.port, url2.query_params]
  end

  private
  def set_params(address)
    return {} if !address.to_s.include? '?'
    params = address.to_s.split('?').last.split('&')
    params.each_with_object({}) do |param, acc|
      key, value = param.split '='
      acc[key.to_sym] = value
    end
  end
end
# END
