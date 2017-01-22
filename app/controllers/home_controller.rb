require 'nokogiri'

class HomeController < ApplicationController
	def index

	end

	def transform
		a = params["send"]
		page = Nokogiri::HTML(a)
		result_attr = {}
		img_node = page.css('img').first
    img_attributes = img_node.attributes.values # list of image attributes
    	# e.g., to output key-value pairs:
    img_attributes.each do |attr|
      result_attr[attr.name] =  attr.value
    end
    result = "<%= image_tag(\'" + result_attr['src'] + "'"
    result_attr.delete('src')
    result_attr.each_with_index do |(k, v), index|
    	result = result + ( ", #{k}: \'#{v}\'")
    end
    result = result + " %>"
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
