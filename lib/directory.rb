@students = []

def interactive_menu
  loop do
    show_options
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1" then input_students
  when "2" then show_students
  when "3" then save_students
  when "4" then load_students
  when "9" then exit
  else puts "I don't know what you mean, try again"
  end
end

def try_load_students
  filename = ARGV.first
  if filename.nil? then load_students; return end
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def show_options
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
  name = STDIN.gets.chomp
  until name.empty?
  @students << { name: name, cohort: :november }
  puts "Now we have #{@students.count} students"
  name = gets.chomp
end
end

def print_header
  puts ""
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
  File.open("students.csv", "w") do |f|
    @students.each do |student|
      f.puts [student[:name], student[:cohort]].join(",")
    end
  end
end

try_load_students
interactive_menu
