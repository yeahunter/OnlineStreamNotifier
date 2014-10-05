import urllib, json, os
f = open('foll','w')
url = "https://api.twitch.tv/kraken/users/yeahunter/follows/channels?limit=100"
response = urllib.urlopen(url);
data = json.loads(response.read())
for key in data["follows"]:
    f.write(key["channel"]["display_name"] + "\n")
f.close()

f = open('foll')
lines = f.readlines()
f.close()

f2 = open('foll2','w')
f2.write(','.join([s.replace('\n', '') for s in lines]).lower())
f2.close()
os.remove('foll')
os.rename('foll2', 'foll')