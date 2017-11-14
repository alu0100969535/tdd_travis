require "prct06/version"

module Prct06
	class Alimento
	
		include Comparable
		attr_reader :nombre, :proteinas, :glucidos, :lipidos
		
		def <=>(other)
			self.valorEnergetico <=> other.valorEnergetico
		end
		
		def initialize(nombre, proteinas, glucidos, lipidos)
			@nombre = nombre
			@proteinas = proteinas
			@glucidos = glucidos
			@lipidos = lipidos
		end
		
		def valorEnergetico()
			@proteinas*4 + @glucidos*4 + @lipidos*9
		end
		
		def to_s()
			"#{@nombre}, Proteinas: #{@proteinas}, Glucidos: #{@glucidos}, Lipidos: #{@lipidos}. Valor Energético: #{self.valorEnergetico}"
		end
	end
	
	class Grupo < Alimento
		attr_reader :nombreGrupo
	
		def initialize(nombre_grupo, nombre, proteinas, glucidos, lipidos)
			@nombreGrupo = nombre_grupo
			super(nombre,proteinas,glucidos,lipidos)
		end
		
	end
	
end