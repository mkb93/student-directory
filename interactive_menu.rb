#variables
@center_amount ='please enter the name of the students and the cohort they are in'
.length
@cohorts = [:January, :April, :July, :November]
#methods
def input_students 
  puts 'please enter the name of the students and the cohort they are in'.center(@center_amount)
  puts "To finish, do not enter a name and press enter".center(@center_amount)
  #make an empty array
  students = []
  #get student name
  name = gets[0...-1]
  
  while !name.empty? do 
    #get student cohort
    puts 'what cohort are they in?'.center(@center_amount)
    cohort = gets[0...-1].capitalize.to_sym
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
        cohort = gets[0...-1].capitalize.to_sym
      end
    end
    # add student to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students".center(@center_amount)
    #get another name and cohort from user
    name = gets[0...-1]
  end
  #return students array 
  students
end

def print_header
  puts "The students of Villians Academy".center(@center_amount)
  puts "----------------".center(@center_amount)
end

def print(names)
  @cohorts.each do |coh|
    
    names.each do |name|
      if name[:cohort] == coh
        puts "#{name[:name]} (#{name[:cohort]} cohort)".center(@center_amount)
      end
    end
  end
end

def print_footer(names)
  if names.count >1
    puts "Overall, we have #{names.count} great students".center(@center_amount)
  elsif names.count == 1 
    puts "Overall, we have #{names.count} great student".center(@center_amount)
  end
end

def interactive_menu
  students = []
  loop do
    # print the interactive menu
    puts 'press 1 for input the students'.center(@center_amount)
    puts 'press 2 for show the students'.center(@center_amount)
    puts 'press 9 for exit'.center(@center_amount)
    # take the useer input and save it
    selection = gets.chomp
    #do what the user asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts 'Thats not an option'.center(@center_amount)
    end
  end
end
interactive_menu