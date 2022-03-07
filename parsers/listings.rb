html = Nokogiri.HTML(content)

products = html.css('div[data-stack-index="0"] section div.flex.flex-wrap div.mb1.ph1.pa0-xl')
# p products
products.each do |product|
  href = product.css('a.absolute.w-100.h-100.z-1 > @href').text
  # p href
  url = "https://www.walmart.com#{href}"
  pages << {
      url: url,
      page_type: 'products',
      fetch_type: 'browser',
      vars: {}
    }
end

pagination_links = html.css('.list.flex.items-center.justify-center.pa0 li')
next_ur = pagination_links.css('a')[4].text.to_i
i = 2
p next_ur
while i <= next_ur
  url = "https://www.walmart.com/browse/movies-tv-shows/4096?facet=new_releases%3ALast+90+Days&page=#{i}&affinityOverride=default"
  pages << {
      url: url,
      page_type: 'listings',
      fetch_type: 'browser',
      vars: {}
    }
  i += 1
end