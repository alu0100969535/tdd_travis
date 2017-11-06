require "prct06/version"

module Prct06
	class Alimento
		attr_reader :nombre, :proteinas, :glucidos, :lipidos
		
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
end