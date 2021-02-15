# Codility 01 - Binary Gap

```
Write a function:

   def solution(n)

that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.

N is an integer within the range [1..2,147,483,647].
```

* https://app.codility.com/programmers/lessons/1-iterations/binary_gap/
* https://docs.google.com/document/d/1tF8UlyzxRaOhvD3c9PU5W7caN5sLSjWfg9rK8isQ4s4/edit?usp=sharing (my private notes)


## Solution

Solution can be found in `lib/solution.rb`

Codility evealuated this solution 100%  <https://app.codility.com/demo/results/trainingAHPRBH-DA6/>

## Notes

as Codility is interested mainly on performance and not on code elegance this code is ugly but satisies
Codility performance obsession

Notable other more pretty Ruby solutions may involve:

#### Hint1:

```ruby
binary.scan(/0+/).max.size
```


#### Hint2:

after removing suffix and prefix zeros:

```ruby
binary.split('1')
```

... and counting longest occurance of zeros 

