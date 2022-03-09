pages << {
    page_type: "listings",
    method: "GET",
    headers: {
        "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36",
        "Sec-Ch-Ua-Platform" => "Windows",
        "Sec-CH-UA" => '"Not A;Brand";v="99", "Chromium";v="96", "Google Chrome";v="96"',
    },
    url: "https://www.walmart.com/browse/movies-tv-shows/4096?facet=new_releases:Last+90+Days",
    fetch_type: "browser",
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
         "fullPage": true,
         "type": "jpeg",
         "quality": 75
       }
    }
  }
  