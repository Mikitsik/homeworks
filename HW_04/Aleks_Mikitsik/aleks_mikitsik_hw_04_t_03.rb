def one_arr(arr)
	@one_arr = []
	arr.map { |e| @one_arr << e  }
end

p one_arr([7, 3, [4, 5, 1], 1, 9, [2, 8, 1]])