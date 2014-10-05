import urllib, urllib2, json, os
push_url = "http://push.peti.ml/pub?id=streams"
directory = os.path.dirname(os.path.realpath(__file__))

url = "https://api.twitch.tv/kraken/streams?limit=100&channel=" + open(directory + '/foll').readlines()[0]
response = urllib.urlopen(url);
data = json.loads(response.read())

if not os.path.exists(directory + '/online1'):
    open(directory + '/online1', 'w').close() 

f = open(directory + '/_online1','w')
for key, value in data.items():
    if key in 'streams':
        for keyke, valueka in enumerate(value):
            streamername = valueka["channel"]["display_name"]
            if streamername not in open(directory + '/online1').read():
                f.write(streamername + "\n")
                # print streamername + " nincs fajlban"
                req = urllib2.Request(push_url, "TwitchTV | " + streamername + " just went live!")
                rsp = urllib2.urlopen(req)
            else:
                f.write(streamername + "\n")
                # print streamername + " faljban"

f.close()
os.remove(directory + '/online1')
os.rename(directory + '/_online1', directory + '/online1')
