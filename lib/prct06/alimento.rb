#Clase que representa un alimento cualquiera, que puede contener varios atributos básicos,
#y puede calcular su valor energético.
class Alimento

	include Comparable
	attr_reader :nombre, :proteinas, :glucidos, :lipidos
	attr_accessor :datosIg
	#Método necesario para el mixin Comparable
	def <=>(other)
		self.valorEnergetico <=> other.valorEnergetico
	end
	
	def initialize(nombre, proteinas, glucidos, lipidos)
		@nombre = nombre
		@proteinas = proteinas
		@glucidos = glucidos
		@lipidos = lipidos
		@datosIg = -1
	end
	#Método qe calcula el área incremental bajo la curva (AIBC), necesario para el cálculo del índice glucémico
	#@return [Array] Si no hay error, devuelve un array (posición por persona) con su AIBC individual para este alimento
	#@return [FixNum] Devuelve -1 en caso de error
	def aibc
		if @datosIg == -1
			return -1
		else
			datos = Array.new
			
			datosIg.each do |dato|
				datos <<[]
				dato.each_cons(2) { |valor| datos.last.push( (valor[1] - dato[0] + valor[0] - dato[0])/2 * 5) }
			end 
			
			datos.map {|x| (x.reduce :+).round(2)}
		end
	end
	
	#Método que calcula el valor energético del alimentos
	# @return [FixNum] el valor enegético del alimento
	def valorEnergetico()
		@proteinas*4 + @glucidos*4 + @lipidos*9
	end
	#Transforma en una cadena de caracteres, para una mejor visualización
	# @return [String] Nombre, proteínas, glúcidos, lípidos y valor energético.
	def to_s()
		"#{@nombre}, Proteinas: #{@proteinas}, Glucidos: #{@glucidos}, Lipidos: #{@lipidos}. Valor Energético: #{self.valorEnergetico}"
	end
end

#Clase derivada de Alimento, que representa un alimento y un grupo de alimentos.
class Grupo < Alimento
	attr_reader :nombreGrupo

	def initialize(nombre_grupo, nombre, proteinas, glucidos, lipidos)
		@nombreGrupo = nombre_grupo
		super(nombre,proteinas,glucidos,lipidos)
	end
	
end