def input_students 
  puts 'please enter the name, height, hobby and nationality of the students'
  puts "To finish, just hit return twice when asked for a name"
  #make an empty array
  students = []
  #get student name, height, hobby, nationality
  puts 'name first'
  name = gets.chomp
  puts "how tall is #{name}?"
  height = gets.chomp
  puts "what is #{name}'s favourite hobby?"
  hobby = gets.chomp
  puts "where is #{name} from?"
  nationality = gets.chomp
  while !name.empty? do 
    # add student to the array
    students << {name: name, 
      cohort: :november,
      height: height,
      hobby: hobby,
      nationality: nationality
    }
    puts "Now we have #{students.count} students"
    #get another students name, height, hobby, nationality
    puts 'name first or press enter to skip'
    name = gets.chomp
    if name.length >0
      puts "how tall is #{name}?"
      height = gets.chomp
      puts "what is #{name}'s favourite hobby?"
      hobby = gets.chomp
      puts "where is #{name} from?"
      nationality = gets.chomp
    end
  end
  #return students array 
  students
end

def print_header
  puts "the students of Villians Academy"
  puts "----------------"
end

def print(names)
  names.each do |name|
    puts "#{name[:name]} (#{name[:cohort]} cohort),
    they are #{name[:height]} cms tall,
    they like to #{name[:hobby]},
    they are originally from #{name[:nationality]}"
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