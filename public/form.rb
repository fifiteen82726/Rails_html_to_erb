require 'nokogiri'




 html = %q("<form accept-charset="UTF-8" action="/search" method="get">
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
url = main_form['action']
method = main_form['method']

form_tag = "<%= form_tag(\'" + url + "\', method: \'" + method+  "\' ) do %>"

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