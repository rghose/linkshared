require 'uri'

class Ewarel < ActiveRecord::Base
	#attr_accessor :url, :is_public
	has_one :user
	
	def self.url_is_valid(url)
		if url =~ URI::regexp
			return true
		end
		return false
	end
end
