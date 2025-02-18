proc count_words_robust {text} {
  # Remove consecutive spaces and normalize whitespace
  regsub -all {\s+} $text { } text
  # Trim leading and trailing spaces
  string trim $text text
  if {[string length $text] == 0} {
    return 0
  }
  set words [regexp -all -inline {\S+} $text]
  return [llength $words]
}

puts [count_words_robust {This is a test string.}]
puts [count_words_robust {This is a  test string.}]
puts [count_words_robust {     }]
puts [count_words_robust {This is a test string.  }]