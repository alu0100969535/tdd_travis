require "list"

RSpec.describe "List tests" do
	context "Probando los métodos" do
		before :each do
			@lista = Lista.new();
		end
		it "Instanciando un objeto lista" do
			expect(@lista.class).to be Lista
		end
	end
end