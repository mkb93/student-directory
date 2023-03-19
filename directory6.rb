#methods
def input_students 
  puts 'please enter the names of the students'.center(@center_amount)
  puts "To finish, just hit return twice".center(@center_amount)
  #make an empty array
  students = []
  #get student name
  name = gets.chomp
  while !name.empty? do 
    # add student to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students".center(@center_amount)
    #get another name from user
    name = gets.chomp
  end
  #return students array 
  students
end

def print_header
  puts "the students of Villians Academy".center(@center_amount)
  puts "----------------".center(@center_amount)
end

def print(names)
  names.each do |name|
    puts "#{name[:name]} (#{name[:cohort]} cohort)".center(@center_amount)
    puts "----------------".center(@center_amount)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(@center_amount)
end

#nothing happens until we call these methods
#variables
@center_amount =  'please enter the names of the students'.length
students = input_students
print_header
print(students)
print_footer(students)