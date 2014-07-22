require_relative 'colors'
require_relative 'test_suite'
#def expect_equal(a, b) #a, and b are the arguements
#     a == b # we're expecting a to be equal to b
#end

#this is the process of testing. asserting they're equal to each other.

#def expect_not_equal(a, b)
#  a != b
#end

#def tests_passed?(results)
#  results.collect {|r| r if r == false}.compact.empty?
#end

include TestSuite

results = []

color = Colors.add('Yellow', 'Blue')
results << expect_equal(color, 'green')

color = Colors.add('Blue', 'Yellow')
results << expect_equal(color, 'green')

color = Colors.add('red', 'blue')
results << expect_equal(color, 'purple')

color = Colors.add('red', 'yellow')
results << expect_not_equal(color, 'purple')
results << expect_equal(color, 'orange')

value = Colors.makes_green?(['blue', 'yellow'])
results << expect_equal(value, true)

value = Colors.makes_green?(['red', 'yellow'])
results << expect_equal(value, false)

value = Colors.valid_color?('black')
results << expect_equal(value, false)

value = Colors.valid_color?('red')
results << expect_equal(value, true)

value = Colors.valid_color?('blue')
results << expect_equal(value, true)

value = Colors.valid_color?('yellow')
results << expect_equal(value, true)

value = Colors.makes_orange?(['yellow', 'red'])
results << expect_equal(value, true)

value = Colors.makes_green?(['blue', 'red'])
results << expect_equal(value, false)

  
if tests_passed?(results)
  puts "test passed"
else
  puts "tests failed"
end
