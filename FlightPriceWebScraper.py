import requests
from bs4 import BeautifulSoup

def get_flight_prices():
    # Replace this URL with the actual URL of the website you want to scrape
    url = 'https://example.com/flights'
    
    # Send an HTTP GET request to the website
    response = requests.get(url)
    
    # Check if the request was successful
    if response.status_code == 200:
        soup = BeautifulSoup(response.text, 'html.parser')
        
        # Use the appropriate HTML tags and attributes to locate flight prices
        # Modify the following line to match the structure of the website you're scraping
        flight_price_elements = soup.find_all('span', class_='flight-price')
        
        # Extract and print flight prices
        for element in flight_price_elements:
            price = element.text
            print(price)
    else:
        print('Failed to retrieve the webpage.')

if __name__ == "__main__":
    get_flight_prices()
