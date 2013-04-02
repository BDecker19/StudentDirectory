class Person
  attr_accessor :id
  attr_accessor :type
  attr_accessor :name
  attr_accessor :email
  
  # Get a reference to the database (HINT - don't need to change this)
  #
  def self.open_database(name)
    @@db = SQLite3::Database.new(name)
  end

  # Close the database (HINT - don't need to change this)
  #
  def self.close_database
    @@db.close
  end

  # Only used for the tests, don't need to call, you can just use @@db
  def self.db
    @@db
  end

  # Builds either a Student or an Instructor, depending on the value of type
  #
  def self.create_person(type)
    case type
    when 'Student' 
      Student.new
    when 'Instructor'
      Instructor.new
    else
      nil
    end
  end

  def self.convert_DB_object(db_object)
    person = Person.create_person(db_object[1])
      
    # Set general attributes
    person.id = db_object[0]
    person.type = db_object[1]
    person.name = db_object[2]
    person.email = db_object[3]

    # Set student/instructor specific attributes
    if person.type == "Student"
      person.reason_for_joining = db_object[4]
    elsif person.type == "Instructor"
      person.iq = db_object[5]
    else puts "Error creating person!!" # should raise exception instead?
    end

    return person

  end

  # TODO - Return an array of either Student or Instructor objects, using information
  # stored in the database
  #
  def self.all    
    people = []
    results = @@db.execute("select * from people")
    results.each do |db_object|
      people << Person.convert_DB_object(db_object)
    end
    return people

  end

  def self.find_by_name(name)
    people = []
    results = @@db.execute("select * from people where name LIKE '%#{name}%'")
    results.each do |db_object|
      people << Person.convert_DB_object(db_object)
    end
    return people  
  end

  # Prompt the user for some questions, common to all Person classes
  #
  def ask_questions
    print "What is your name? "
    self.name = gets.strip.chomp
    print "What is your email? "
    self.email = gets.strip.chomp
  end
end