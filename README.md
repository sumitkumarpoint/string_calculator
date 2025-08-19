# String Calculator  

This project implements a simple **String Calculator** in Ruby.

## Features  

- Returns `0` for empty or `nil` input.  
- Supports numbers separated by **commas (`,`)** or **newlines (`\n`)**.  
- Supports custom delimiters:  
  - Single-character delimiter (e.g., `//;\n1;2;3`).  
  - Multi-character delimiter (e.g., `//[***]\n1***2***3`).  
  - Multiple delimiters (e.g., `//[*][%]\n1*2%3`).  
- Throws an exception if negative numbers are included.  

---

## Installation  

Clone the repo and install dependencies:  

```bash
git clone <your-repo-url>
cd string_calculator
bundle install
```

---

## Usage  

### Default delimiters (`,` and `\n`):  
```ruby
calc = StringCalculator.new
calc.add("1,2,3")   # => 6
calc.add("1\n2,3")  # => 6
calc.add("")        # => 0
calc.add(nil)       # => 0
```

### Custom single delimiter:  
```ruby
calc.add("//;\n1;2;3")  
# => 6
```

### Custom multi-character delimiter:  
```ruby
calc.add("//[***]\n1***2***3")  
# => 6
```

### Multiple delimiters:  
```ruby
calc.add("//[*][%]\n1*2%3")  
# => 6
```

### Negative numbers:  
```ruby
calc.add("1,-2,3")  
# => ArgumentError: negative numbers not allowed: -2
```

---

## Running Tests  

This project includes an RSpec test suite.  


### Run tests:  
```bash
rspec string_calculator_spec.rb
```

---

