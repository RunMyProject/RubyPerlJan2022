# RubyPerlJan2022
Scripts required for free language code challenge (I chose Ruby and Perl for completeness)

---

* Weather data
In weather.dat there are data with meteorological surveys. The first column contains
the day of the month, while the second and third contain the temperature respectively
maximum and minimum for that day. Write a program that given the input file returns
the day with the smallest temperature difference.

---

* Football league
The football.dat file contains the results of the English premier league. The columns with
label "F" and "A" contain the total number of goals scored and conceded by each team
in season. For example, Arsenal have scored 79 goals (F) and conceded 36 (A).
Write a program that, given the input file, returns the team with the least difference
between goals scored and conceded.

---

# Explanation of the Solution

---

[ Exercise 1 ]

I chose the PERL language as I thought it was the most suitable for man-machine interaction.

PERL is often used for prototyping programs
which are then developed in other programming languages
and is extremely convenient for writing "throw away" programs.

No PERL compilers have been created yet,
probably because there is no real need for it.

**DataMeteo.pl**

In the first part of the program we make use of configuration and installation
of external modules, lines 14-23

Followed by man-machine interface control, lines 34-43

Then the existence of the file indicated in keyboard input is checked, lines 47-50

Then we define a custom package called "datameteo" and a new one
sub call datimeteo_data useful to instantiate the internal objects for
manage day and temperatures, lines 54-70

Next, you open the file from line 82 and read the lines.
In the event of an error, program execution is blocked.

Finally, at 130, the result required by the exercise is printed.

[ Exercise 2 ]

I chose the RUBY language as it lends itself well to managing the balance and harmony of the script language
for good man-machine interaction.

Indeed RUBY was born with the idea of ​​merging the PERL, Smalltalk, Eiffel, Ada and Lisp languages ​​to create
a new language that can balance Functional Programming with Imperative Programming.

Today RUBY is considered more powerful than PERL and at the same time more object oriented than PYTHON.

**football.rb**

In the first part of the program the human-machine interaction is built and verified
the existence of the input file, lines 23-32.

Subsequently from line 34 to 50 the temporary variables are initialized and constructed
the final result class with its own method of printing class member attributes.

Then the file indicated in input is opened and the lines are checked with a parser on the separating space.
The compatible lines are verified and the values ​​of goals scored and conceded are extracted.
The absolute value of the minor difference is stored in the temporary variable initialized first.
Entire block of statements in lines 54-86.

Finally, a new object is instantiated starting from the Result class which will print on the screen
the final result.

---

