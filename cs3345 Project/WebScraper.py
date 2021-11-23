import csv
from bs4 import BeautifulSoup
from selenium import webdriver



#conver amazon search url
def get(search_term):
    template = 'https://www.amazon.com/s?k={}&ref=nb_sb_noss_1'
    search_term = search_term.replace(' ','+')
    
    url = template.format(search_term)
    
    url += '&page{}'
    
    return url
	
#scraping data
def extract_record(item):
    atag = item.h2.a
    
    des = atag.text.strip()
    url = 'https://www.amazon.com'+atag.get('href')
    try:
        price = item.find('span', 'a-price')
        p = price.find('span', 'a-offscreen').text
        rating = item.i.text
        
    except AttributeError:
        return

    result = (des, p, rating)
    return result


def main(search_term):
    driver = webdriver.Chrome()
    
    records = []
    url = get(search_term)
    #scrap page range
    for page in range(1,3):
        driver.get(url.format(page))
        soup = BeautifulSoup(driver.page_source, 'html.parser')
        results = soup.find_all('div', {'data-component-type': 's-search-result'})
        
		#append data to records
        for item in results:
            record = extract_record(item)
            if record:
                records.append(record)
                
    driver.close()
	
    #Import data to Excel
    with open('result.csv', 'w', newline='', encoding = 'utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(['Description', 'Price', 'Rating'])
        writer.writerows(records)

#Search Item name
main('Google Pixel')

