Node = Struct.new(:value, :next, :prev)

class Lista
	attr_reader :head, :tail
	
	def initialize 
		@head = Node.new(0,nil,nil)
		@tail = @head
	end
	
	
	
end