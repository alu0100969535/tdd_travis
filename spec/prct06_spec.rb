require "spec_helper"
require "prct06"

RSpec.describe Prct06 do
	it "has a version number" do
		expect(Prct06::VERSION).not_to be nil
	end
	
end

RSpec.describe Prct06 do

	before :each do
		@Nombre = "Huevo frito"
		@Proteinas = 14.1
		@Glucidos = 0.0
		@Lipidos = 19.5
		@valor_energetico = 231.9
		@to_s = "#{@Nombre}, Proteinas: #{@Proteinas}, Glucidos: #{@Glucidos}, Lipidos: #{@Lipidos}. Valor Energético: #{@valor_energetico}"
		
		@alimento = Prct06::Alimento.new(@Nombre, @Proteinas, @Glucidos, @Lipidos)
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
		expect(@alimento.calcular).to eq(@valor_energetico)
	end
	
	it "has 'to_s' method" do
		expect(@alimento.to_s).to eq(@to_s)
	end
end
