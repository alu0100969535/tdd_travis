Node = Struct.new(:value, :next, :prev)

class Lista
	attr_reader :head, :tail, :size
	
	def initialize 
		@head = Node.new(0,nil,nil)
		@tail = @head
		@size = 0
	end
	
	def insert(var)
		if var.instance_of?(Array)
			var.each do |i|
				antiguo = @head
				@head = Node.new(i,nil,antiguo)
				antiguo.next = @head
				@size += 1
			end
		else
			antiguo = @head
			@head = Node.new(var,nil,antiguo)
			antiguo.next = @head
			@size += 1
		end
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