#Clase que representa un alimento cualquiera, que puede contener varios atributos básicos,
#y puede calcular su valor energético.
class Alimento

	include Comparable
	attr_reader :nombre, :proteinas, :glucidos, :lipidos
	#Método necesario para el mixin Comparable
	def <=>(other)
		self.valorEnergetico <=> other.valorEnergetico
	end
	
	def initialize(nombre, proteinas, glucidos, lipidos)
		@nombre = nombre
		@proteinas = proteinas
		@glucidos = glucidos
		@lipidos = lipidos
	end
	#Método que calcula el valor energético del alimentos
	# @return [FixNum] , el valor enegético del alimento
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