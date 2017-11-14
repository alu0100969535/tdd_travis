require "list"

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