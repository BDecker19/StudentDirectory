StudentDirectory
================

A more advanced app for creating a directory of students enrolled on the WDI course, backed by a SQLite3 database.

# Install / running

* cd into projects/StudentDirectory
* Add a remote called dmgarland and pull my latest code
```git remote add dmgarland https://github.com/dmgarland/StudentDirectory.git```

* Change to the database branch:

```git checkout database```

* Pull my branch into your local branch
```git pull dmgarland database```

* To run the program: 

```ruby student_directory.rb```
* To run the tests:
 
```ruby test/person_test.rb```

```ruby test/student.rb```

```ruby test/instructor.rb```

# TODO
1. Fix the people test, so that you can create Student or Instructor objects out of the information in the database.
2. Change the student_directory.rb program so that when I press 'p' from the menu, I see a list of everyone in the database, and all of their attributes.
3. Fix the student test, so that you can persist a Student object to the database. Check that it works using the test provided and the sqlite3 command:
```sqlite3 test/test.db```
4. Do the same for instructor.
5. Try your changes out in the main student_directory.rb program, so that you can save multiple students and instructors to the student_directory.db database, and see the results using sqlite3.
6. Fix the person test so that you can search for people in the database when I select 's' from the menu. Improve your method so that it can return a partial match, e.g. if I search for "a" I want to find "Dan".
7. If you've got this far, improve your code so that I can delete a person when you provide me with his primary key. 
8. If you're still stuck for something to do, how about improving the program so that I can edit the code that's there?
9. If you get this far, see if you can port your existing student directory over to use a SQLite3 database and see if you took the same approach as I did.
10. Brownie points for people with the most object-orientated approach. Where can your code be refactored and refined?
