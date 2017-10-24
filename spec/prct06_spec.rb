require "spec_helper"
require "prct06"

RSpec.describe Prct06 do
	it "has a version number" do
		expect(Prct06::VERSION).not_to be nil
	end
	
end

RSpec.describe Prct06 do
	before :each do
		@alimento = Prct06::Alimento.new("Nombre", 10, 10, 10)
	end
	
	it "has 'nombre' attribute" do
		expect(@alimento.nombre).not_to be nil
	end
	
	it "has 'proteinas' attribute" do
		expect(@alimento.proteinas).not_to be nil
	end
	
	it "has 'glucidos' attribute" do
		expect(@alimento.glucidos).not_to be nil
	end
	
	it "has 'lipidos' attribute" do
		expect(@alimento.lipidos).not_to be nil
	end
	
	it "has 'calcular' method and working correctly" do
		expect(@alimento.calcular).to eq(10*4 + 10*4 + 10*9)
	end
	
	it "has 'to_s' method" do
		expect(@alimento.to_s).to eq("Nombre, Proteinas: 10, Glucidos: 10, Lipidos: 10. Valor Energético: 170")
	end
end
