from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from urllib.parse import urlparse
import argparse
import sys


def scrape(url):
    # <div data-cy="question-title" class="css-v3d350">560. Subarray Sum Equals K</div>
    # driver.find_element_by_xpath('//input[@node-type="searchInput"]')

    options = Options()
    options.headless = True

    driver = webdriver.Chrome(options=options)

    driver.get(url)
    element = driver.find_element_by_xpath('//div[@data-cy="question-title"]')
    print(element.text.lower().replace(" ", "-").replace(".", ""))
    driver.quit()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Setup C++ folder for leetcode question."
    )
    parser.add_argument("url", type=str, help="Leetcode question url")

    try:
        args = parser.parse_args()
        scrape(args.url)
    except:
        print("ERR:", sys.exc_info()[0])
