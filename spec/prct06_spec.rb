require "spec_helper"
require "prct06"

RSpec.describe Prct06 do
	it "has a version number" do
		expect(Prct06::VERSION).not_to be nil
	end
	
end

RSpec.describe Prct06 do
	before :each do
		@alimento = Prct06::Alimento.new("Nombre")
	end
	
	it "has 'name' attribute" do
		expect(@alimento.name).not_to be nil
	end
end
