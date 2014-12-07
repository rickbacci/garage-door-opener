require 'sinatra'

require 'wiringpi'
require 'pi_piper'
include PiPiper


def activate_door
  pin = PiPiper::Pin.new(:pin => 17, :direction => :out, :invert => false)
  pin.off
  sleep 1
  pin.on
end

def check_status
  watch :pin => 7 do
  puts "Pin changed from #{last_value} to #{value}"
  return "OPEN" if last_value == 1
  "CLOSED"
end

end

# def check_status
#   @gpio = WiringPi::GPIO.new
#   status = @gpio.read(7)

#   return "OPEN" if status == 1 
#   "CLOSED"
# end

# def press_button
#   @gpio = WiringPi::GPIO.new

#   @gpio.write(0, 0)
#   sleep 1
#   @gpio.write(0, 1)
# end

get '/' do
  erb :index
end

get '/activate' do
  erb :activate  
end
