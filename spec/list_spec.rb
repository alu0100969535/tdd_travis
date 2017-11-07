require "list"

RSpec.describe "List tests" do
	context "Probando los métodos" do
		before :each do
			@lista = Lista.new();
		end
		it "Instanciando un objeto lista" do
			expect(@lista.class).to be Lista
		end
		
		it "Tiene el método 'head'" do
			expect(@lista.head).not_to be nil
		end
		
		it "Tiene el método 'tail'" do
			expect(@lista.tail).not_to be nil
		end
	end
end