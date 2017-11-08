require "spec_helper"
require "prct06"


RSpec.describe "Bundler automatic tests" do
	it "has a version number" do
		expect(Prct06::VERSION).not_to be nil
	end
	
end

RSpec.describe "Test de la clase Alimento" do

	before :each do
		@Nombre = "Huevo frito"
		@Proteinas = 14.1
		@Glucidos = 0.0
		@Lipidos = 19.5
		@valor_energetico = 231.9
		@to_s = "#{@Nombre}, Proteinas: #{@Proteinas}, Glucidos: #{@Glucidos}, Lipidos: #{@Lipidos}. Valor Energético: #{@valor_energetico}"
		
		@alimento = Prct06::Alimento.new(@Nombre, @Proteinas, @Glucidos, @Lipidos)
	end
	
	context "Iniciando el objeto Alimento" do
		
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
	end
	
	context "Probando los métodos de cálculo" do
		it "has 'valorEnergetico' method and working correctly" do
			expect(@alimento.valorEnergetico).to eq(@valor_energetico)
		end
		
		it "has 'to_s' method" do
			expect(@alimento.to_s).to eq(@to_s)
		end
	end
	
	context "Pruebas a 6 alimentos diferentes" do
		before :each do
			@Proteinas = [1.2, 0.3, 1.3, 1.0, 2.0, 23.5]
			@Glucidos = [21.4, 12.8, 5.8, 3.5, 15.4, 52.0]
			@Lipidos = [0.2, 0.4, 0.3, 0.2, 0.1, 1.4]
			
			@alimento1 = Prct06::Alimento.new("Plátanos", @Proteinas[0], @Glucidos[0], @Lipidos[0])
			@alimento2 = Prct06::Alimento.new("Manzana", @Proteinas[1], @Glucidos[1], @Lipidos[1])
			@alimento3 = Prct06::Alimento.new("Cebolla", @Proteinas[2], @Glucidos[2], @Lipidos[2])
			@alimento4 = Prct06::Alimento.new("Tomate", @Proteinas[3], @Glucidos[3], @Lipidos[3])
			@alimento5 = Prct06::Alimento.new("Papas", @Proteinas[4], @Glucidos[4], @Lipidos[4])
			@alimento6 = Prct06::Alimento.new("Lentejas", @Proteinas[5], @Glucidos[5], @Lipidos[5])
		end
			
		context "Cálculo" do		
			[0, 1, 2, 3, 4, 5].each do |x|
				it "Alimento#{x+1}" do
					alimentos = [@alimento1, @alimento2, @alimento3, @alimento4, @alimento5, @alimento6]
					expect(alimentos[x].valorEnergetico).to eq(@Proteinas[x]*4 + @Glucidos[x]*4 + @Lipidos[x]*9)
				end
			end
		end
	end
end

RSpec.describe "Test de la clase Grupo < Alimento" do
	before :each do
		@grupo1 = Prct06::Grupo.new("Huevos, lácteos y Helados","Huevo frito", 14.1, 0.0, 19.5)
	end
	
	it "iniciando objeto Grupo" do
		expect(@grupo1.class).to be Grupo
	end	
end