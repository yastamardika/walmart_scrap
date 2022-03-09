pages << {
    page_type: "listings",
    method: "GET",
    headers: {
        "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
        "sec-ch-ua" => '"Not A;Brand";v="99", "Chromium";v="98", "Google Chrome";v="98"',
        "sec-ch-ua-mobile"=> "?0",
        "sec-ch-ua-platform"=> '"Linux"',
        "sec-fetch-dest"=> "document",
        "sec-fetch-mode"=> "navigate",
        "sec-fetch-site" => "same-origin",
        "sec-fetch-user" => "?1",
        "upgrade-insecure-requests" => "1"
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
  