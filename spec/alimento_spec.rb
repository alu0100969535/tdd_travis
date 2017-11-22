require "spec_helper"

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
		
		@alimento = Alimento.new(@Nombre, @Proteinas, @Glucidos, @Lipidos)
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
			
			@alimento1 = Alimento.new("Plátanos", @Proteinas[0], @Glucidos[0], @Lipidos[0])
			@alimento2 = Alimento.new("Manzana", @Proteinas[1], @Glucidos[1], @Lipidos[1])
			@alimento3 = Alimento.new("Cebolla", @Proteinas[2], @Glucidos[2], @Lipidos[2])
			@alimento4 = Alimento.new("Tomate", @Proteinas[3], @Glucidos[3], @Lipidos[3])
			@alimento5 = Alimento.new("Papas", @Proteinas[4], @Glucidos[4], @Lipidos[4])
			@alimento6 = Alimento.new("Lentejas", @Proteinas[5], @Glucidos[5], @Lipidos[5])
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
		@grupo1 = Grupo.new("Huevos, lácteos y Helados","Huevo frito", 14.1, 0.0, 19.5)
	end
	
	it "iniciando objeto Grupo" do
		expect(@grupo1.class).to be Grupo
	end	
	
	it "Esperamos que el objeto grupo sea de tipo Grupo" do
		expect(@grupo1.is_a?(Grupo)).to be true
	end
	
	it "Esperamos que el objeto grupo sea una instancia de Grupo" do
		expect(@grupo1.instance_of?(Grupo)).to be true
	end
	
	it "Esperamos que la clase grupo tenga superclass como Alimento" do
		expect(Grupo.superclass).to be Alimento
	end
	
	it "Contiene el alimento correspondiente" do
		expect(@grupo1.nombre).to eq("Huevo frito") 
	end
	
	it "Tiene el método nombreGrupo" do
		expect(@grupo1.nombreGrupo).to eq("Huevos, lácteos y Helados")
	end
end

RSpec.describe "Test de las listas de alimentos" do
	
	before :each do
		@list = Lista.new()		
	end
	
	it "Pruebas de los alimentos del grupo de 'Huevos, lácteos y Helados'" do
		alimento1 = Grupo.new("Huevos, lácteos y Helados","Huevo frito", 14.1, 0.0, 19.5)
		alimento2 = Grupo.new("Huevos, lácteos y Helados","Leche vaca", 3.3, 4.8, 3.2)
		alimento3 = Grupo.new("Huevos, lácteos y Helados","Yogurt", 3.8, 4.9, 3.8)
		@list.insert([alimento1, alimento2, alimento3])
		expect(@list.size).to eq(3)
		expect(@list.head.class).to eq(Node)
		expect(@list.head.value.class).to eq(Grupo)
	end
	
	it "Pruebas de los alimentos del grupo de 'Carnes y derivados'" do
		alimento1 = Grupo.new("Carnes y derivados","Cerdo", 21.5, 0.0, 6.3)
		alimento2 = Grupo.new("Carnes y derivados","Ternera", 21.1, 0.0, 3.1)
		alimento3 = Grupo.new("Carnes y derivados","Pollo", 20.6, 0.0, 5.6)
		@list.insert([alimento1, alimento2, alimento3])
		expect(@list.size).to eq(3)
		expect(@list.head.class).to eq(Node)
		expect(@list.head.value.class).to eq(Grupo)
	end
	
	it "Pruebas de los alimentos del grupo de 'Pescados y Mariscos'" do
		alimento1 = Grupo.new("Pescados y Mariscos","Bacalao", 17.7, 0.0, 0.4)
		alimento2 = Grupo.new("Pescados y Mariscos","Atún", 21.5, 0.0, 15.5)
		alimento3 = Grupo.new("Pescados y Mariscos","Salmón", 19.9, 0.0, 13.6)
		@list.insert([alimento1, alimento2, alimento3])
		expect(@list.size).to eq(3)
		expect(@list.head.class).to eq(Node)
		expect(@list.head.value.class).to eq(Grupo)
	end
	
	it "Pruebas de los alimentos del grupo de 'Alimentos grasos'" do
		alimento1 = Grupo.new("Alimentos grasos","Aceite de oliva", 0.0, 0.2, 99.6)
		alimento2 = Grupo.new("Alimentos grasos","Mantequilla", 0.7, 0.0, 83.2)
		alimento3 = Grupo.new("Alimentos grasos","Chocolate", 5.3, 47.0, 30.0)
		@list.insert([alimento1, alimento2, alimento3])
		expect(@list.size).to eq(3)
		expect(@list.head.class).to eq(Node)
		expect(@list.head.value.class).to eq(Grupo)
	end
	
	it "Pruebas de los alimentos del grupo de 'Alimentos ricos en carbohidratos'" do
		alimento1 = Grupo.new("Alimentos ricos en carbohidratos","Azúcar", 0.0, 99.8, 0.0)
		alimento2 = Grupo.new("Alimentos ricos en carbohidratos","Arroz", 6.8, 77.7, 0.6)
		alimento3 = Grupo.new("Alimentos ricos en carbohidratos","Lentejas", 23.5, 52.0, 1.4)
		alimento4 = Grupo.new("Alimentos ricos en carbohidratos","Papas", 2.0, 15.4, 0.1)
		@list.insert([alimento1, alimento2, alimento3, alimento4])
		expect(@list.size).to eq(4)
		expect(@list.head.class).to eq(Node)
		expect(@list.head.value.class).to eq(Grupo)
	end
	
	it "Pruebas de los alimentos del grupo de 'Verduras y Hortalizas'" do
		alimento1 = Grupo.new("Verduras y Hortalizas","Tomate", 1.0, 3.5, 0.2)
		alimento2 = Grupo.new("Verduras y Hortalizas","Cebolla", 1.3, 5.8, 0.3)
		alimento3 = Grupo.new("Verduras y Hortalizas","Calabaza", 1.1, 4.8, 0.1)
		@list.insert([alimento1, alimento2, alimento3])
		expect(@list.size).to eq(3)
		expect(@list.head.class).to eq(Node)
		expect(@list.head.value.class).to eq(Grupo)
	end
	
	it "Pruebas de los alimentos del grupo de 'Frutas'" do
		alimento1 = Grupo.new("Frutas","Huevo frito", 0.3, 12.4, 0.4)
		alimento2 = Grupo.new("Frutas","Leche vaca", 1.2, 21.4, 0.2)
		alimento3 = Grupo.new("Frutas","Yogurt", 0.5, 12.7, 0.3)
		@list.insert([alimento1, alimento2, alimento3])
		expect(@list.size).to eq(3)
		expect(@list.head.class).to eq(Node)
		expect(@list.head.value.class).to eq(Grupo)
	end
	
end

RSpec.describe "Test de comparable" do

	before :each do
		
		@alimento1 = Alimento.new("Huevo frito", 14.1, 0.0, 19.5)
		@alimento2 = Alimento.new("Manzana", 0.3, 12.8, 0.4)
		@alimento3 = Alimento.new("Huevo frito", 14.1, 0.0, 19.5)
		@alimento4 = Alimento.new("Papas", 2.0, 15.4, 0.1)
		
	end
	
	it "Comparable" do
		expect(@alimento1 > @alimento2).to eq(true)
		expect(@alimento2 < @alimento3).to eq(true)
		expect(@alimento1 == @alimento2).to eq(false)
		expect(@alimento1 == @alimento3).to eq(true)
		expect(@alimento2.between?(@alimento1,@alimento4)).to eq(false)
	end
	
end

RSpec.describe "Test indice glucémico" do
	before :each do
		@alimento1 = Alimento.new("Compota de Manzana", 0.0, 0.0, 0.0)	#Los valores de glucosa,lipidos y proteínas no importan para esta parte.
		@alimento2 = Alimento.new("Yogurt", 0.0, 0.0, 0.0)
		@glucosa = Alimento.new("Glucosa", 0.0, 0.0, 0.0)
	end
	
	it "Tiene el método aibc" do
		expect(@alimento1.respond_to?(:aibc)).to eq(true)
	end
	
	it "Tiene el atributo datosIG" do
		expect(@alimento1.respond_to?(:datosIg)).to eq(true)
	end
	
	it "AIBC devuelve -1 en caso de no definir datosIG antes de ejecutarla" do
		expect(@alimento1.aibc).to eq(-1)
		@alimento1.datosIg = [ 	[4.9, 5.3, 5.9, 6.7, 7.2, 7.6, 8.0, 8.2, 8.2, 8.4, 8.3, 8.3, 8.0, 7.5, 7.1, 6.8, 6.8, 6.9, 6.8, 6.3, 6.2, 6.3, 6.2, 6.3, 6.1],	#Persona1
								[6.3, 5.4, 5.6, 5.7, 6.5, 7.4, 7.9, 7.4, 7.7, 7.9, 7.9, 7.8, 7.8, 7.8, 8.0, 8.5, 9.4, 10.8, 10.5, 9.1, 8.9, 8.3, 7.7, 7.6, 7.5]	#Persona2
							  ]
		expect(@alimento1.aibc).not_to eq(-1)
	end
	
	it "El método aibc realiza el cálculo correctamente" do
		@alimento1.datosIg = [ [6.7, 6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2, 7.3, 7.0, 6.8, 6.7, 6.8, 6.7, 6.9],	#Persona1
								[4.6, 4.8, 5.3, 5.6, 6.1, 6.5, 6.6, 7.0, 7.0, 6.8, 6.4, 6.3, 6.1, 6.1, 6.2, 6.0, 6.1, 6.1, 6.2, 6.3, 6.4, 6.1, 6.1, 5.7, 5.9]	#Persona2
							  ]
		expect(@alimento1.aibc).to eq([27.50, 183.25])
		
		@glucosa.datosIg = [ 	[4.9, 5.3, 5.9, 6.7, 7.2, 7.6, 8.0, 8.2, 8.2, 8.4, 8.3, 8.3, 8.0, 7.5, 7.1, 6.8, 6.8, 6.9, 6.8, 6.3, 6.2, 6.3, 6.2, 6.3, 6.1],
								[6.3, 5.4, 5.6, 5.7, 6.5, 7.4, 7.9, 7.4, 7.7, 7.9, 7.9, 7.8, 7.8, 7.8, 8.0, 8.5, 9.4, 10.8, 10.5, 9.1, 8.9, 8.3, 7.7, 7.6, 7.5]
							  ]
		expect(@glucosa.aibc).to eq([256.0, 186.5])
		
		igInd = [@alimento1.aibc[0]/@glucosa.aibc[0]*100, @alimento1.aibc[1]/@glucosa.aibc[1]*100]
		suma = igInd.reduce(:+)
		expect((suma / @alimento1.aibc.length).round(2)).to eq(54.5)
		
	end
end
