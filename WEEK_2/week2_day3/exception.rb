=begin essai N°1 
		
1 / 0

#$ exception.rb:1:in `/': divided by 0 (ZeroDivisionError)
#$	from exception.rb:1:in `<main>'
=end


=begin essai N°2
begin
  # Any exceptions in here... 
  1/0
rescue
  # ...will cause this code to run
  puts "Got an exception, but I'm responding intelligently!"
  do_something_intelligent()
end

#$ Got an exception, but I'm responding intelligently!
#$ exception.rb:14:in `rescue in <main>': undefined method `do_something_intelligent' for main:Object (NoMethodError)
#$ 	from exception.rb:8:in `<main>'
=end

=begin essai N°3
begin
  # Any exceptions in here... 
  1/0
rescue ZeroDivisionError => e
  puts "Exception Class: #{ e.class.name }"
  puts "Exception Message: #{ e.message }"
  puts "Exception Backtrace: #{ e.backtrace }"
end

#$ Exception Class: ZeroDivisionError
#$ Exception Message: divided by 0
#$ Exception Backtrace: ["exception.rb:26:in `/'", "exception.rb:26:in `<main>'"]
=end

=begin essai N°3 : bad way !

// Don't do this 
begin
  do_something()
rescue Exception => e
  ...
end
=end

=begin essai N°4 : right  way ! 
=end 

begin
	1 / 0
  do_something()
rescue => e # (= "rescue StandardError => e")
  # Only your app's exceptions are swallowed. Things like SyntaxErrror are left alone. 
end









