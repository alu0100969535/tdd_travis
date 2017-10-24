require "prct06/version"

module Prct06
	class Alimento
		attr_reader :name, :proteins
		
		def initialize(nombre, proteinas)
			@name = nombre
			@proteins = proteinas
		end
	end
end