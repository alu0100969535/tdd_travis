#Tipo de objeto nodo, para el uso en la lista doblemente enlazada.
Node = Struct.new(:value, :next, :prev)


# Esta clase se ha creado para representar listas
# doblemente enlazada para trabajar con los alimentos.
class Lista
	include Enumerable

	attr_reader :head, :tail, :size
	#Método necesario para que funcione el mixin Enumerable.
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
	#Método para insertar un objeto en la lista.
	#@param var [Object] un Objeto cualquiera o un Array con Objetos cualesquiera
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
	#Elimina el objeto que está en la cola (tail) de la lista
	#@return [FixNum] Nuevo tamaño de la lista
	def pop
		if @tail.nil? == false
			nuevo = @tail.next
			@tail = nuevo
			@size -= 1
		end
	end
	#Elimina el objeto que está en la cabeza (head) de la lista
	#@return [FixNum] Nuevo tamaño de la lista
	def shift
		if @head.nil? == false
			nuevo = @head.prev
			@head = nuevo
			@size -= 1
		end
	end
	
	private :ins
	
end