Node = Struct.new(:value, :next, :prev)

class Lista
	attr_reader :head
	
	def initialize 
		@head = Struct::Node.new(0,0,0)
		#@next Node
	end
	
	
	
end