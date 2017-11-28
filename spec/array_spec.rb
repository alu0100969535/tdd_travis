require "spec_helper"

RSpec.describe "Benchmark de ordenación" do
	before :each do
		@tabla = Array.new
		@tabla =[Grupo.new("Huevos, lácteos y Helados","Huevo frito", 14.1, 0.0, 19.5),
				Grupo.new("Huevos, lácteos y Helados","Leche vaca", 3.3, 4.8, 3.2),
				Grupo.new("Huevos, lácteos y Helados","Yogurt", 3.8, 4.9, 3.8),
				Grupo.new("Carnes y derivados","Cerdo", 21.5, 0.0, 6.3),
				Grupo.new("Carnes y derivados","Ternera", 21.1, 0.0, 3.1),
				Grupo.new("Carnes y derivados","Pollo", 20.6, 0.0, 5.6),
				Grupo.new("Pescados y Mariscos","Bacalao", 17.7, 0.0, 0.4),
				Grupo.new("Pescados y Mariscos","Atún", 21.5, 0.0, 15.5),
				Grupo.new("Pescados y Mariscos","Salmón", 19.9, 0.0, 13.6),
				Grupo.new("Alimentos grasos","Aceite de oliva", 0.0, 0.2, 99.6),
				Grupo.new("Alimentos grasos","Mantequilla", 0.7, 0.0, 83.2),
				Grupo.new("Alimentos grasos","Chocolate", 5.3, 47.0, 30.0),
				Grupo.new("Alimentos ricos en carbohidratos","Azúcar", 0.0, 99.8, 0.0),
				Grupo.new("Alimentos ricos en carbohidratos","Arroz", 6.8, 77.7, 0.6),
				Grupo.new("Alimentos ricos en carbohidratos","Lentejas", 23.5, 52.0, 1.4),
				Grupo.new("Alimentos ricos en carbohidratos","Papas", 2.0, 15.4, 0.1),
				Grupo.new("Verduras y Hortalizas","Tomate", 1.0, 3.5, 0.2),
				Grupo.new("Verduras y Hortalizas","Cebolla", 1.3, 5.8, 0.3),
				Grupo.new("Verduras y Hortalizas","Calabaza", 1.1, 4.8, 0.1),
				Grupo.new("Frutas","Manzana", 0.3, 12.4, 0.4),
				Grupo.new("Frutas","Plátanos", 1.2, 21.4, 0.2),
				Grupo.new("Frutas","Pera", 0.5, 12.7, 0.3)
				]
	end
	
	it "Ordenando manualmente con for" do
		resultado = @tabla.bubbleSortFor
		expect(resultado).to eq(   [Grupo.new("Verduras y Hortalizas","Tomate", 1.0, 3.5, 0.2),
									Grupo.new("Verduras y Hortalizas","Calabaza", 1.1, 4.8, 0.1),
									Grupo.new("Verduras y Hortalizas","Cebolla", 1.3, 5.8, 0.3),
									Grupo.new("Frutas","Manzana", 0.3, 12.4, 0.4),
									Grupo.new("Frutas","Pera", 0.5, 12.7, 0.3),
									Grupo.new("Huevos, lácteos y Helados","Leche vaca", 3.3, 4.8, 3.2),
									Grupo.new("Huevos, lácteos y Helados","Yogurt", 3.8, 4.9, 3.8),
									Grupo.new("Alimentos ricos en carbohidratos","Papas", 2.0, 15.4, 0.1),
									Grupo.new("Pescados y Mariscos","Bacalao", 17.7, 0.0, 0.4),
									Grupo.new("Frutas","Plátanos", 1.2, 21.4, 0.2),
									Grupo.new("Carnes y derivados","Ternera", 21.1, 0.0, 3.1),
									Grupo.new("Carnes y derivados","Pollo", 20.6, 0.0, 5.6),
									Grupo.new("Carnes y derivados","Cerdo", 21.5, 0.0, 6.3),
									Grupo.new("Pescados y Mariscos","Salmón", 19.9, 0.0, 13.6),
									Grupo.new("Pescados y Mariscos","Atún", 21.5, 0.0, 15.5),
									Grupo.new("Huevos, lácteos y Helados","Huevo frito", 14.1, 0.0, 19.5),
									Grupo.new("Alimentos ricos en carbohidratos","Lentejas", 23.5, 52.0, 1.4),
									Grupo.new("Alimentos ricos en carbohidratos","Arroz", 6.8, 77.7, 0.6),
									Grupo.new("Alimentos ricos en carbohidratos","Azúcar", 0.0, 99.8, 0.0),
									Grupo.new("Alimentos grasos","Chocolate", 5.3, 47.0, 30.0),
									Grupo.new("Alimentos grasos","Mantequilla", 0.7, 0.0, 83.2),
									Grupo.new("Alimentos grasos","Aceite de oliva", 0.0, 0.2, 99.6)])
	end
end