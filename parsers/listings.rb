html = Nokogiri.HTML(content)

p html
products = html.css('div[data-stack-index="0"] section div.flex.flex-wrap div.mb1.ph1.pa0-xl')
p products
products.each do |product|
  href = product.css('a.absolute.w-100.h-100.z-1 > @href').text
  p href
  url = "https://www.walmart.com#{href}"
  pages << {
      url: url,
      page_type: 'products',
      fetch_type: 'browser',
      vars: {},
      headers: {
        "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36",
        "Sec-Ch-Ua-Platform" => "Windows"
      },
      driver: {
        pre_code: "await page.setViewport({
            width: 1920 + Math.floor(Math.random() * 100),
            height: 3000 + Math.floor(Math.random() * 100),
            deviceScaleFactor: 1,
            hasTouch: false,
            isLandscape: false,
            isMobile: false,
        });",
        disable_adblocker: true,
      }
    }
end

# pagination_links = html.css('.list.flex.items-center.justify-center.pa0 li')
# next_ur = pagination_links ? pagination_links.css('a')[4].text.to_i : 0
next_ur = html.css('.list.flex.items-center.justify-center.pa0 li a[aria-label="Next Page"] > @href')

if next_ur != []
  url = "https://www.walmart.com#{next_ur}"
  pages << {
      url: url,
      page_type: 'listings',
      fetch_type: 'browser',
      headers: {
        "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36",
        "Sec-Ch-Ua-Platform" => "Windows"
      },
      driver: {
        pre_code: "await page.setViewport({
            width: 1920 + Math.floor(Math.random() * 100),
            height: 3000 + Math.floor(Math.random() * 100),
            deviceScaleFactor: 1,
            hasTouch: false,
            isLandscape: false,
            isMobile: false,
        });",
        disable_adblocker: true,
      },
      screenshot: {
        "take_screenshot": true,
        "options": {
         "fullPage": false,
         "type": "jpeg",
         "quality": 75
       }
      }
    }
end