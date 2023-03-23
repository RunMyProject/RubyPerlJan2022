#!/usr/bin/ruby -w
###################
# * Lega football #
###################

=begin
Il file football.dat contiene i risultati della premier league inglese. 
Le colonne con etichetta "F" e "A" contengono il numero totale di goal segnati 
e subiti da ogni squadra nella stagione. 
Ad esempio l'Arsenal ha segnato 79 goal (F) e ne ha subiti 36 (A).

Scrivere un programma che dato il file in input ritorni la squadra con la minor differenza
fra goal segnati e subiti.
=end

#############################################################################################

puts "* Lega football"
puts "****************"

# human-machine interface
#
print "Inserire il nome del file /:>"
filename = gets.chomp
puts "Nome file '" << filename << "'"

# check if file exists
# 
if !File.exist?(filename)
  puts 'ERROR: file does not exist'
  exit(false)
end

# initialize vars
#
minore_differenza = 1000
squadra = ""
boolRead = false

# create class Result
#
class Result
	def initialize(squadra, minore_differenza)
		@cust_squadra = squadra
		@cust_minore_differenza = minore_differenza
	end
	def print_results
	   puts "La squadra con minor differenza fra goal segnati e subiti e' " << @cust_squadra << " (" << @cust_minore_differenza.to_s << ")."
	end
end

# open file
#
File.foreach(filename) {
	|line|
	myArray = line.split

	if boolRead == true 
		# check if line is good
		# 
		if myArray.length == 10
			f = myArray[6]
			a = myArray[8]
			diff = f.to_i - a.to_i
			# store temp result
			# 
			if diff.abs < minore_differenza
				minore_differenza = diff.abs
				squadra = myArray[1] 
			end
		else puts "WRONG: line not accepted" << line
		end
	end

	# check if file is compatible
	# 
	if !boolRead
		if myArray.length == 8
		   boolRead = true
		else
		   puts "FATAL ERROR: file not compatible"
		   exit(false)
		end
	end 

}
# Now using above class to create the object result
# 
object = Result. new(squadra, minore_differenza)
object.print_results
