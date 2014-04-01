#1
array = [1,2,3,4,5,6,7,8,9,10] 
# array.each do |num|
# 	puts num
# end

#2
# array.each do |num|
# 	if num > 5
# 		puts num
# 	end
# end

#3
odd = array.select {|num| num.odd?}

#4
array.push 11
array.unshift 0

#5
array.pop
array.push 3

#6
array.uniq!

#7
# Arrays are referenced by numerical index, beginning from 0
# Hashes are essentially array-like (or they just are arrays) that
# whose values are referenced via key-value pairs.

#8
#1.8 Syntax
hash = ['a' => 1, 'b' => 2, 'c' => 3, 'd' => 4,]

#1.9 Syntax
hash2 = {a: 1, b: 2, c: 3, d: 4}

#9
puts hash2[:b]

#10
hash2['e'] = 5

#11
hash2.delete_if {|k, v| v < 3.5}

#12
hash3 = {a: 1, b: ['a', 'b', 'c'], c: 3, d: 'four'}
array4 = ['a','b',{a: 1, b:2, c:3},'e', 'f']

#13
# I could only find 2 documentation sources for the general Ruby and
# Rails api, and one of them did not work consistantly. The official
# ones don't seem all that easy to understand, so I am not a big fan
# (especially the rails api), but I am not aware of alternatives out
# there that are as in-depth