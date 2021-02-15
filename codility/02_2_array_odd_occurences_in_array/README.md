# Codility 02.2 OddOccurrencesInArray


* https://app.codility.com/programmers/lessons/2-arrays/odd_occurrences_in_array/
* https://docs.google.com/document/d/1tF8UlyzxRaOhvD3c9PU5W7caN5sLSjWfg9rK8isQ4s4/edit?usp=sharing (my private notes)


```
A[0] = 9  A[1] = 3  A[2] = 9
A[3] = 3  A[4] = 9  A[5] = 7
A[6] = 9

N is an odd integer within the range [1..1,000,000];
each element of array A is an integer within the range [1..1,000,000,000];
all but one of the values in A occur an even number of times.
```


solution with tests can be found in `spec/solution_spec.rb`

```ruby
  def solution(a)
    occurences = {}
    a.each do |item|
      if occurences[item]
        occurences[item] = false
      else
        occurences[item] = true
      end
    end

    occurences.select { |k, v| v }.keys.first
  end
```

Yep it's ugly but Codility evaluated it 100%


### Prettier solution

this solution:

```ruby
  def solution(a)
    a.detect{ |e| a.count(e).odd? }
  end
```

will work but will get evaluated at 66% due to Codility performance
obsession

