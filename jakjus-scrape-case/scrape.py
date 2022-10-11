import requests

def scrape_and_send(event, context):
    url = "https://steamcommunity.com/market/itemordershistogram?country=KR&language=english&currency=1&item_nameid=175966708&two_factor=0"
    page = requests.get(url)
    lowest_sell_order = page.json()["lowest_sell_order"]
    
    # Paste your own Webhook URL
    webhook_url = "https://discord.com/api/webhooks/123123123123123/y0urstr1ngh3re"
    message = f"Current price of **Clutch Case** is **{lowest_sell_order} cents**."
    
    # Run the webhook
    requests.post(webhook_url, data = {"content": message})
    return { 'message': 'OK' }
