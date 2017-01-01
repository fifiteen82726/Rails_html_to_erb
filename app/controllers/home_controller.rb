require 'nokogiri'

class HomeController < ApplicationController
	def index

	end

	def transform
		a = params["send"]
		page = Nokogiri::HTML(a)
		img = page.css('img')[0]
		src =  ""
		alt =  ""
		class_atr = ""
		src =  img['src'] if img['src'].present?
		alt =  img['alt'] if img['alt'].present?
		class_atr = img['class'] if img['class'].present?
		result = "<%= image_tag(\'" + src + '\', :class => \'' + class_atr + '\', :alt => \'' + alt + '\')%>'
		render :json => {"result" => result }
	end


	def link


	end


	def form
		a = params["send"]
		page = Nokogiri::HTML(a)
		form = page.css('form')[0]
		class_atr = ""
		class_atr = form['class'] if form['class'].present?
		action = ""
		action = form['action'] if form['action'].present?
		method = ""
		method = form['method'] if form['method'].present?
		form_tag = "<%= form_tag(\'" + action + "\', method: \'" + method+  "\'" + ":class => \'" + class_atr+ "\' ) do |f| %>"
		render :json => {"result" => form_tag }
	end

	def input

	end

end
