class Array
	def bubbleSortFor
		n = self.length
		resultado = self
		
		for i in 0...n-1
			for j in 0...n-i-1
				if resultado[j] > resultado[j+1]
					temp = resultado[j]
					resultado[j] = resultado[j+1]
					resultado[j+1] = temp
				end
			end
		end
		return resultado
	end
	
	def bubbleSortEach
		resultado = Array.new
        resultado << self[0]
		
        self.drop(1).each do |i|
            resultado.each_with_index do |j,index|
                if i <= j
                    resultado.insert(index,i)
                    break
                end
                if index == resultado.length-1
                    resultado << i
                    break
                end
            end
        end
        return resultado
	end

end