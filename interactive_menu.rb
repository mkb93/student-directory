#variables
@center_string ='please enter the name of the students and the cohort they are in'
@center_amount =@center_string.length
@cohorts = [:January, :April, :July, :November]
@students = []

#methods
def add_student(name, cohort)
  @students << {name: name, cohort: cohort}
end

def add_cohort
  puts 'what cohort are they in?'.center(@center_amount)
  cohort = STDIN.gets[0...-1].capitalize.to_sym
  #check that the have entered a relevant cohort
  while !@cohorts.include?(cohort)
    #run as normal
    if cohort.empty?
      # use default value for student cohort
      cohort = :November
    else
      puts 'please select one of 4 cohorts'
      .center(@center_amount)
      puts 'November, January, April, July'.center(@center_amount)
      cohort = STDIN.gets[0...-1].capitalize.to_sym
    end
  end
  cohort
end

def input_students 
  puts @center_string.center(@center_amount)
  puts "To finish, do not enter a name and press enter".center(@center_amount)
  
  #get student name
  name = STDIN.gets[0...-1]
  
  while !name.empty? do 
    #get student cohort
    cohort = add_cohort
    # add student to the array
    add_student(name, cohort)
    puts "Now we have #{@students.count} students".center(@center_amount)
    #get another name and cohort from user
    name = STDIN.gets[0...-1]
  end
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    filename = 'students.csv'
  end
  if File.exist?(filename)
    load_students(filename)
    puts "loaded #{@students.count} from #{filename}"
  else
    puts "sorry #{filename} does not exist"
    exit
  end
end

def load_students(fileName = 'students.csv')
  file = File.open(fileName, 'r')
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort.to_sym)
  end
  file.close
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
end

def print_header
  puts "The students of Villians Academy".center(@center_amount)
  puts "----------------".center(@center_amount)
end

def print_student_list
  @cohorts.each do |coh|
    
    @students.each do |name|
      if name[:cohort] == coh
        puts "#{name[:name]} (#{name[:cohort]} cohort)".center(@center_amount)
      end
    end
  end
end

def print_footer
  if @students.count >1
    puts "Overall, we have #{@students.count} great students".center(@center_amount)
  elsif @students.count == 1 
    puts "Overall, we have #{@students.count} great student".center(@center_amount)
  end
end

def print_menu
  # print the interactive menu method
  puts 'press 1 for input the students'.center(@center_amount)
  puts 'press 2 for show the students'.center(@center_amount)
  puts 'press 3 save the list to students.csv'.center(@center_amount)
  puts 'press 4 to load student list from studens.csv'.center(@center_amount)
  puts 'press 9 for exit'.center(@center_amount)
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)

    #do what the user asked
    case selection
      when "1"
        input_students
      when "2"
    show_students
      when "3"
        save_students
      when "4"
        load_students
      when "9"
        exit
      else
        puts 'Thats not an option'.center(@center_amount)
    end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students

interactive_menu