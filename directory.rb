student_count = 11
# let's put all the student names in an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Micheal Corleone",
  "Alec DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
  ]
puts "the students of Villians Academy"
puts "----------------"
#then we print the students
students.each do |student|
  puts student
end
#Finally, we print the total
puts "Overall, we have #{student_count} great students"
