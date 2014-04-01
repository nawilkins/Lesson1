
#1
var_outer = 'This is an outer variable'

reassign = var_outer
puts reassign
puts var_outer

if var_outer != ''
	var_outer = 'this was not empty!'
end

if var_outer != ''
	puts var_outer.upcase
  puts var_outer
end

if var_outer == var_outer.downcase
  var_outer.upcase!
end

#2

def method(arg1)
  puts 'we are now in the second method'
  var_inner_inner = 'I am an inner, inner variable'
  puts arg1
  puts var_inner
end

def method2(arg1)
  puts 'we are in the first method'
  var_inner = 'I am an inner variable'
  puts var_inner
  method(arg1)
  puts var_inner_inner
 end

outer_var = 'I am an outer variable'
method2(outer_var)

puts var_inner
puts var_inner_inner
