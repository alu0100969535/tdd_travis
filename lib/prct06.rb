require "prct06/version"

module Prct06
	class Alimento
		attr_reader :name
		
		def initialize(nombre)
			@name = nombre
		end
	end
end