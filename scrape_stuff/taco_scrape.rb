require 'mechanize'
require 'pry'
require 'yaml'

browser = Mechanize.new
yelp = browser.get('http://yelp.com/salt-lake-city')
form = yelp.form_with(id: 'header_find_form')
text_field = form.field_with(name: 'find_desc')
text_field.value = ('tacos') #value in the form
results_page = form.submit #submitting form
puts results_page.class

#the next thing we need to do is links. need to see the results. figure out where the results
#living.

results = results_page.search('.natural-search-result') # this will return all li. now parse each thing
restaurants = []
results.each do |result|
  name = result.search('h3.search-result-title').text.gsub("\n", '').strip
  address = result.search('address').text.gsub("\n", '').strip
  phone = result.search('.biz-phone').text.gsub("\n", '').strip
  restaurants << {name: name, address: address, phone: phone}
end

File.open('tacos.yml', 'w+') do |f|
  f.write(restaurants.to_yaml)
end
