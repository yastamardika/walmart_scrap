html = Nokogiri.HTML(content)

# initialize an empty hash
product = {}

#extract title
product['title'] = html.at_css('h1.lh-copy').text.strip
p product['title'] 

#extract current price
product['current_price'] = html.at_css('[itemprop="price"]').text.strip 

#extract original price
original_price_div = html.at_css('.w_r')
original_price = original_price_div ? original_price_div.text.strip.gsub('$','').to_f : nil
product['original_price'] = original_price == 0.0 ? nil : original_price

#extract rating
rating = html.at_css('.f7.rating-number').text.strip.gsub('(','').gsub(')','').to_f
product['rating'] = rating == 0 ? nil : rating

#extract number of reviews
review_text = html.at_css('[itemprop="ratingCount"]').text.strip
product['reviews_count'] = review_text =~ /reviews/ ? review_text.split(' ').first.to_i : 0

#extract publisher
product['publisher'] = html.at_css('[itemprop="brand"]').text.strip

#extract walmart item number
# product['walmart_number'] = html.at_css('.prod-productsecondaryinformation .wm-item-number').text.split('#').last.strip

#extract product image
product['img_url'] = html.at_css('[data-testid="vertical-hero-carousel"] img.db > @src')

#extract product categories
product['categories'] = html.css('[aria-label="breadcrumb"] ol li').collect{|li| li.text.strip.gsub('/','') }

# specify the collection where this record will be stored
product['_collection'] = 'products'

# save the product to the job’s outputs
outputs << product