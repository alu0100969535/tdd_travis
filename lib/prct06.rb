require "prct06/version"

module Prct06
	class Alimento
		attr_reader :nombre, :proteinas
		
		def initialize(nombre, proteinas)
			@nombre = nombre
			@proteinas = proteinas
		end
	end
end