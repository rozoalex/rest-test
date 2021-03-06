require 'json'
require 'rest-client'

class UserClient
  attr_reader :name

  def initialize name
    @name = name
    @log = []
  end

  def get_hello_cam
    response = RestClient.get 'https://cryptic-anchorage-60369.herokuapp.com/hello', {}
    resp_hash = JSON.parse(response)
    key = Time.now.to_s
    entry = {}
    entry[key] = resp_hash['hello']
    @log.push(entry)
    if @log.length > 50
      @log.shift
    end
    puts @log.inspect
  end

  def get_hello_zhou
    response = RestClient.get 'https://arcane-inlet-50840.herokuapp.com/', {}
    resp_hash = JSON.parse(response)
    key = Time.now.to_s
    entry = {}
    entry[key] = resp_hash['hello']
    @log.push(entry)
    if @log.length > 50
      @log.shift
    end
    puts @log.inspect
  end

#  def get_hello_zhou
#    response = RestClient.get 'https://cryptic-anchorage-60369.herokuapp.com/hello', {}
#    resp_hash = JSON.parse(response)
#    key = Time.now.to_s
#    entry = {}
#    entry[key] = resp_hash['hello']
#    @log.push(entry)
#    if @log.length > 50
#      @log.shift
#    end
#    puts @log.inspect
#  end
end
