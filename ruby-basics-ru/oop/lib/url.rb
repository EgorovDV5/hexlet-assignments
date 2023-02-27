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

  def ==(url2)
    if url2.scheme == self.scheme && 
       url2.host == self.host && 
       url2.port == self.port && 
       url2.query_params.sort == self.query_params.sort
    return true
    else
      return false
    end
  end

  def_delegators :address, :scheme, :host, :port

  private
  def set_params(address)
    return {} if !address.to_s.include? '?'
    params = address.to_s.split('?').last.split('&')
    params.each_with_object({}) do |param, acc|
      args = param.split('=')
      acc[args.first.to_sym] ||= nil
      acc[args.first.to_sym] = args.last
    end
  end
end
# END
