require 'nokogiri'

class HomeController < ApplicationController
	def index
		
	end


	def transform
		# binding.pry
		a = params["send"]
		b = a.tr('/', '')
		# input = %q(a)
		# binding.pry
		page = Nokogiri::HTML(b)   
		img = page.css('img')[0]
		src =  ""
		alt =  ""
		class_atr = ""
		src =  img['src']
		alt =  img['alt']
		class_atr = img['class']
		result = "<%= image_tag(\'" + src + '\', :class => \'' + class_atr + '\', :alt => \'' + alt + '\')%>'
		p result
		binding.pry
	end

end
