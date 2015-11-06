1.  All form_tag method or simple_form default will include method: :post and authentic_token.
2.  Label should begin with capital letter with every words.
3.  map(&:role), send method name to all object to map method
It's like map { |i| i.role }

map() == collect() collect all objects
each, each_with_index iteratar
select() select some of the objects, based on proc result.
inject() calculate the sum from all objects

Less common:
group_by return hash from array
names = ["James", "Bob", "Joe", "Mark", "Jim"]
names.group_by{|name| name.length} 
    => {5=>["James"], 3=>["Bob", "Joe", "Jim"], 4=>["Mark"]} 

grep grep from array based on regex
names.grep(/J/)
    => ["James", "Joe", "Jim"]



