def progress(&block)
  0.step(100, 10, &block)
end

progress { |percent| puts percent }

# Define the progress method and use the built-in step method on the Numeric class
#  to iterate from 0 to 100 in increments of 10, calling the block on each iteration
#  and passing it the current percent complete.
