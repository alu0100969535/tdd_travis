Node = Struct.new(:value, :next, :prev)

class Lista
	attr_reader :head, :tail, :size
	
	def initialize 
		@head = Node.new(0,nil,nil)
		@tail = @head
		@size = 0
	end
	
	def insert(var)
		antiguo = @head
		@head = Node.new(var,nil,antiguo)
		@size += 1
	end
	
	def pop
		nuevo = @tail.next
		@tail = nuevo
		@size -= 1
	end
	
	def shift
		nuevo = @head.prev
		@head = nuevo
		@size -= 1
	end
	
end