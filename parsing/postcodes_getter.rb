require 'httparty'
require 'json'



class Postcodesio
	include HTTParty #this is to include a module 

	base_uri 'https://api.postcodes.io/'


	def single_postcodes(postcode)
		self.class.get("/postcodes/#{postcode}")
	end

	def multiple_postcodes(postcodes_array)
		JSON.parse(self.class.post("/postcodes", body: { "postcodes" => postcodes_array}).body)
	end

end

x = Postcodesio.new
# puts x.multiple_postcodes(["lu40lf","le16wt"])