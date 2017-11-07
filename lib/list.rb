Node = Struct.new(:value, :next, :prev)

class Lista
	attr_reader :head,:tail
	
	def initialize 
		@head = Node.new(0,nil,nil)
		@tail = @head
	end
	
	def insert(var)
		antiguo = @head
		@head = Node.new(var,nil,antiguo)
	end
	
	def to_s
		nodo = @head
		string = ""
		begin
			string += "[#{nodo.value}]"
			if nodo != tail
				string += " -> "
			end
		end while nodo != tail
		return string
	end
	
end