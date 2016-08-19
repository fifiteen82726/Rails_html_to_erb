require 'nokogiri'

class HomeController < ApplicationController
	def index
		
	end

	def transform
		# binding.pry
		a = params["send"]
		page = Nokogiri::HTML(a) 
		img = page.css('img')[0]
		src =  ""
		alt =  ""
		class_atr = ""
		src =  img['src']
		alt =  img['alt'] if img['alt'].present?
		class_atr = img['class']
		result = "<%= image_tag(\'" + src + '\', :class => \'' + class_atr + '\', :alt => \'' + alt + '\')%>'
		render :json => {"result" => result } 
	end

end
