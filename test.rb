def diag(length)
    left_to_right = []
    right_to_left = []

    (0..length).each do |i|
        left_to_right << [i, i]
        right_to_left << [i, -(i+1)]
    end

    print left_to_right
    print right_to_left
end