#I found two ways
# the first one requires you to be in the same folder 
puts __FILE__
#the second one doesn't
puts File.basename(__FILE__)

file = File.read(__FILE__)
puts file 
