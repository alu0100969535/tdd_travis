Node = Struct.new(:value, :next, :prev)

class Lista
	include Enumerable

	attr_reader :head, :tail, :size
	
	def each
		actual = @tail
		for i in 0 .. (@size - 1)
			yield actual.value
			actual = actual.next
		end
	end
 	
	def initialize 
		@head = nil
		@tail = nil
		@size = 0
	end
	
	def insert(var)
		if var.instance_of?(Array)
			var.each do |i|
				ins(i)
			end
		else
			ins(var)
		end
	end
	
	def ins(val)
		antiguo = @head
		@head = Node.new(val,nil,antiguo)
		if antiguo.nil? == false
			antiguo.next = @head
		end
		if size == 0
			@tail = @head
		end 
		@size += 1
	end
	
	def pop
		if @tail.nil? == false
			nuevo = @tail.next
			@tail = nuevo
			@size -= 1
		end
	end
	
	def shift
		if @head.nil? == false
			nuevo = @head.prev
			@head = nuevo
			@size -= 1
		end
	end
	
	private :ins
	
end