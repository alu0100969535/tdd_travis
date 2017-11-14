require "list"
require "prct06.rb"

RSpec.describe "List tests" do
	context "Probando los métodos" do
		before :each do
			@lista = Lista.new();
		end
		
		it "Instanciando un objeto lista" do
			expect(@lista.class).to be Lista
		end
		
		it "Tiene el método 'insert'"do
			expect(@lista.insert(0)).not_to be nil
		end
		
		it "Tiene el método 'head'" do
			@lista.insert(1)
			expect(@lista.head).not_to be nil
		end
		
		it "Tiene el método 'tail'" do
			@lista.insert(1)
			expect(@lista.tail).not_to be nil
		end
		
		it "Tiene el método 'size'" do
			expect(@lista.size).not_to be nil
		end
		
		it "Tiene el método 'pop'" do
			@lista.insert(1)
			expect(@lista.pop).not_to be nil
		end
		
		it "Tiene el método 'shift'" do
			@lista.insert(1)
			expect(@lista.shift).not_to be nil
		end
	end
	context "Probando que los métodos funcionan" do
		before :each do
			@lista = Lista.new();
		end
		
		it "El método insert puede insertar varios elementos" do
			@lista.insert([1,2,3,4,5])
			expect(@lista.size).to eq(5)
		end
	end
end

RSpec.describe "Test Enumerable mixin" do

	before :each do
		
		@alimento1 = Prct06::Alimento.new("Huevo frito", 14.1, 0.0, 19.5)
		@alimento2 = Prct06::Alimento.new("Manzana", 0.3, 12.8, 0.4)
		@alimento3 = Prct06::Alimento.new("Huevo frito", 14.1, 0.0, 19.5)
		@alimento4 = Prct06::Alimento.new("Cebolla", 1.3, 5.8, 0.3)
		@alimento5 = Prct06::Alimento.new("Papas", 2.0, 15.4, 0.1)
		@alimento6 = Prct06::Alimento.new("Lentejas", 23.5, 52.0, 1.4)
		@alimento7 = nil
		
		@lista = Lista.new
		
	end
	
	context "Enumerable" do
		
		it ".all?" do
			@lista2 = Lista.new
			@lista.insert([@alimento1,@alimento2,@alimento3,@alimento5,@alimento6,@alimento7])
			@lista2.insert([@alimento1,@alimento2,@alimento3,@alimento5,@alimento6])
			expect(@lista.all?).to eq(false)
			expect(@lista2.all?).to eq(true)
		end
		
	end	
	
end