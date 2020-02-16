@students = []

def interactive_menu
  loop do
    show_options
    process(gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def show_options
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students
  print_footer
end

def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  name = gets.chomp
  until name.empty?
  @students << { name: name, cohort: :november }
  puts "Now we have #{@students.count} students"
  name = gets.chomp
end
end

def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

def print_students
  @students.each_with_index do |student, index|
    puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
  puts ""
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    file.puts [student[:name], student[:cohort]].join(",")
  end
  file.close
end

interactive_menu
