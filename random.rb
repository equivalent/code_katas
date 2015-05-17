# based on Avdi Grim's Ruby Tapas episode 306 random samples

p rand
p rand
p rand

# 0.9677377727207387
# 0.5190986653760239
# 0.15693041700757115


p rand(6)  # 5
p rand(6)  # 4
p rand(6)  # 1

# 0 - 5


p rand(1..6) # 6
p rand(1..6) # 5
p rand(1..6) # 1


list = %w(foo bar car cat)
p list.sample # = foo
p list.sample # = car

p list.sample(3) # ["cat", "foo", "bar"]

