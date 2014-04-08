def ar_meth(array)
	array.each do |val|
		puts val.upcase
	end
end

def ar_meth_perm(array)
	array.each do |val|
		puts val.upcase!
	end
end

array = ['a','b','c','d','e']
puts array
puts '------------'
ar_meth(array)
puts '------------'
puts array
puts '------------'
ar_meth_perm(array)
puts '------------'
puts array