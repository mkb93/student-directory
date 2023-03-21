def input_students 
  puts 'please enter the name of the students and the cohort they are in'.center(@center_amount)
  puts "To finish, do not enter a name and press enter".center(@center_amount)
  #make an empty array
  students = []
  #get student name
  name = gets.chomp
  
  while !name.empty? do 
    #get student cohort
    puts 'what cohort are they in?'.center(@center_amount)
    cohort = gets.chomp.capitalize.to_sym
    #check that the have entered a relevant cohort
    while !@cohorts.include?(cohort)
      #run as normal
      if cohort.empty?
        # use default value for student cohort
        cohort = :november
      else
        puts 'please select one of 4 cohorts'
        .center(@center_amount)
        puts 'November, January, April, July'.center(@center_amount)
        cohort = gets.chomp.capitalize.to_sym
      end
    end
    # add student to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students".center(@center_amount)
    #get another name and cohort from user
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
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(@center_amount)
end


#variables
@center_amount ='please enter the name of the students and the cohort they are in'
.length
@cohorts = [:January, :February,
:March, :April, :May, :June,
:July, :August, :September, :October, 
:November, :December]
students = input_students

print_header
print(students)
print_footer(students)