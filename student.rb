require 'rubygems'
require 'yaml'
require 'pry'

class Person
  attr_accessor :name
  attr_accessor :email
  attr_accessor :github_user
  attr_accessor :twitter
  attr_accessor :fun_fact
  
  def to_s
    "#{self.class} called #{name}"
  end
end

class Student < Person
  attr_accessor :reason_for_joining
end

class Instructor < Person
  attr_accessor :type
end

@directory = []
puts "Student Directory, v0.0.1 by Dan Garland"
print "Enter Student or Instructor, l to load, q to save and quit: "

while ((input = gets.strip.chomp) != 'q') do

  person = nil
  case input
  when 'Student' 
    person = Student.new
    print "What is your name? "
    person.name = gets.strip.chomp
    print "What is your email? "
    person.email = gets.strip.chomp
    
  when 'Instructor'
    person = Instructor.new
    print "What is your name? "
    person.name = gets.strip.chomp
    print "What is your email? "
    person.email = gets.strip.chomp
    print "What sort of instructor are you? "
    person.type = gets.strip.chomp
    
  when 'l'
    # Pull in existing people from a YAML file
    @directory += YAML.load_documents(File.open('student_directory.yml'))
  end
  
  # Append this person to our directory
  @directory << person
  puts @directory
  
  print "Enter Student or Instructor, q to save and quit: "
end

# Open a student_directory.yml YAML file and write it out on one line
File.open('student_directory.yml', 'a') { |f|
  @directory.compact.each do |person|
    f.write(person.to_yaml)
  end   
} 
