require "prct06/version"

module Prct06
	class Alimento
		attr_reader :nombre, :proteinas, :glucidos
		
		def initialize(nombre, proteinas, glucidos)
			@nombre = nombre
			@proteinas = proteinas
			@glucidos = glucidos
		end
	end
end