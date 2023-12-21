import re
def url(url_list):
    list_url_domain=[]
    for url in url_list:
        pattern = r"(?:https?://)?(?:www\.)?([a-zA-Z0-9.-]+)\.[a-zA-Z]{2,}(?:/|$)"
        match=re.search(pattern,url)
        list_url_domain.append(match.group(1))
    return list_url_domain
list_url=[
"https://www.w3schools.com",
"https://subdomain.example.com",
"http://www.another-example.com",
"https://www.google.com/search?q=example",
"https://www.openai.com"
]
print(url(list_url))