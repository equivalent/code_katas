
# Codility 03.2 perm missing elem

* <https://app.codility.com/programmers/lessons/3-time_complexity/tape_equilibrium/>
* <https://docs.google.com/document/d/1tF8UlyzxRaOhvD3c9PU5W7caN5sLSjWfg9rK8isQ4s4/edit> (private personal notes)


```
A - non-empty arary consist of N integers

0 < P < N

P splits tape into two non-empty parts:
  A[0], A[1]   .. A[P-1]
  A[P], A[P+1] .. A[N-1]

difference between this two partts is a value 

  (A[0] + A[1] + ..+ A[P-1] ) - (A[P] + A[P+1] + ..+ A[N-1])

(absolute difference)

* efficient
* N  [2..100_000]
* element in A is integer in range -1_000..1_000

example

A = [3, 1, 2 , 4, 3]

if P = 1
  [[3], [1, 2 , 4, 3]]
  abs(3 - 10) = 7

if P = 2
  [[3, 1], [2 , 4, 3]]
  abs(4 - 9) = 5

if P = 3
  [[3, 1, 2], [4, 3]]
  abs(6 - 7) = 1


if P = 4
  [[3, 1, 2, 4], [3]]
  abs(10 - 3) = 7


solution is 1 as that's the minimal difference that can be achived 

```

## Solution

solution in `spec/solution_spec.rb`

```ruby
```

