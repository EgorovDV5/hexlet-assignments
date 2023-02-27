require 'forwardable'
require 'uri'
# frozen_string_literal: true

# BEGIN
class Url
  extend Forwardable

  attr_reader :address
  
  def initialize(url)
    @address = URI(url)
    @params = set_params(@address)
  end

  def query_params()
    @params
  end

  def query_param(key, value = nil)
    @params.fetch(key, value)
  end

  def <=>(url2)
    return true if url2.scheme == url.scheme && url2.host == url.host && url2.port == url.port && url2.params.sort == url.params.sort
    false 
  end

  def_delegators @address, :scheme, :host, :port

  private
  def set_params(address)
    params = address.to_s.split('?').last.split('&')
    params.each_with_object({}) do |param, acc|
      args = param.split('=')
      acc[args.first] ||= nil
      acc[args.first] = args.last
    end
  end

end
# END
