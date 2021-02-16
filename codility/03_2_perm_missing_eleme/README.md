
# Codility 03.2 perm missing elem

* <https://app.codility.com/programmers/lessons/3-time_complexity/perm_missing_elem/>
* <https://docs.google.com/document/d/1tF8UlyzxRaOhvD3c9PU5W7caN5sLSjWfg9rK8isQ4s4/edit> (private personal notes)


```
  exactly one element is missing.
  given an array A, returns the value of the missing element.

    N is an integer within the range [0..100,000];
    the elements of A are all distinct;
    each element of array A is an integer within the range [1..(N + 1)].
```

## Solution

solution in `spec/solution_spec.rb`

```ruby
  def solution(a)
    return 1 if a.empty?
    (1..(a.size + 1)).inject(:+) - a.inject(:+)
  end
```

This solution  was evaluated 100% by Codility <https://app.codility.com/demo/results/training77JX38-R3K/>


## solution analysis 

as Codility uses Ruby 2.2 the `Array#sum` method canot be used (that's
why `.inject(:+)` it's doing same thing as `#sum`

So this would be nice (will not work on Codility till they upgrade Ruby)

```ruby
  def solution(a)
    return 1 if a.empty?
    (1..(a.size + 1)).sum - a.sum
  end
```


Originally I've posted this solution:

```ruby
def solution(a)
  return 1 if a.empty?
  (a.min..a.max).inject(:+) - a.inject(:+)
end
```

It was evalueted 50% by Codility.


I lost points on performance as I wanted to make this bulletproof and
was expecting array like `[3,4,6]` (I thought there will be some trick
from Codility, I failed to realize that this is not possible if we
assume one of the condition `[1..(N + 1)]`)

Other lost points were on performance due to `#min`. I failed to realize
that given `[1..(N + 1)]` the min element will always be `1`. That means
no need for `a.min`

Last I didn't realize that given `[1..(N + 1)]` when `solution([])`
meaning `N == 0` then `N+1 == 1` so `solution([])` should return `1`
