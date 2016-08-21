require 'nokogiri'




 html = %q("<form accept-charset="UTF-8" action="/search" method="get" class= "2123">
  <input name="utf8" type="hidden" value="&#x2713;" />
  <label for="q">Search for:</label>
  <input id="q" name="q" type="text" />
  <input name="commit" type="submit" value="Search" />
</form>")

=begin

<%= form_tag("/search", method: "get") do %>
  <%= label_tag(:q, "Search for:") %>
  <%= text_field_tag(:q) %>
  <%= submit_tag("Search") %>
<% end %>

=end

form =  Nokogiri::HTML(html) 
main_form = form.css('form')[0]
class_atr = ""
class_atr = main_form['class'] 

		action = ""
		action = main_form['action'] 

		method = ""
		method = main_form['method'] 
p class_atr
p method
p action
form_tag = "<%= form_tag(\'" + action + "\', method: \'" + method+  "\', " + "class: \'" + class_atr+ "\' ) do %>"

end_tag = "<% end %>"


p form_tag
p end_tag


=begin

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

=end