def input_students 
  puts 'please enter the names of the students'
  puts "To finish, just hit return twice"
  #make an empty array
  students = []
  #get student name
  name = gets.chomp
  while !name.empty? do 
    # add student to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from user
    name = gets.chomp
  end
  #return students array 
  students
end

def print_header
  puts "the students of Villians Academy"
  puts "----------------"
end

def print(names)
  i =0
  while i<names.length 
    puts "#{names[i][:name]} (#{names[i][:cohort]} cohort)"
    i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#nothing happens until we call these methods
students = input_students
print_header
print(students)
print_footer(students)