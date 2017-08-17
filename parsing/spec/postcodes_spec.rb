
require_relative '../postcodes_getter.rb'

describe Postcodesio do 
	
	before(:all) do 
		@postcodes = Postcodesio.new
		@response = @postcodes.single_postcodes('lu40lf')

	end

	it 'should have the status code that equals 200 ' do 
		# file = JSON.parse(HTTParty.get('https://api.postcodes.io/postcodes/lu40lf').body)
		expect(@response["status"]).to eq 200
	end

	it 'shouldnt be empty' do 
		expect(@response).not_to be_empty
	end

	it 'should return a hash' do 
		 file = JSON.parse(HTTParty.get('https://api.postcodes.io/postcodes/lu40lf').body)
		expect(file.class).to eq Hash
	end

	it 'should include these keys in results' do 
		file = JSON.parse(HTTParty.get('https://api.postcodes.io/postcodes/lu40lf').body)
		expect(file["result"]).to include("postcode","quality","eastings","northings","country","admin_ward","parish","ccg","nuts")
	end




end