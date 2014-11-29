import urllib, urllib2, json, os
import MySQLdb

class Streamer(object):
    def __init__(self, Name=None, Status=0):
        self.Name = Name
        self.Status = Status

db = MySQLdb.connect("localhost","MySQLuser","MySQLpassword","MySQLdatabase" )
cursor = db.cursor()
cursor.execute("SELECT `Name`, `Status` FROM `Channels`")
streamerek = []
for (Name, Status) in cursor:
    streamerek.append(Streamer(Name, Status))


streamerekapihoz = ""
for Streamer in streamerek:
    streamerekapihoz = streamerekapihoz + ',%s' % Streamer.Name

akikstreamelnek = ""


push_url = "http://push.peti.ml/pub?id=streams"

url = "https://api.twitch.tv/kraken/streams?limit=100&channel=" + streamerekapihoz[1:]
response = urllib.urlopen(url);
data = json.loads(response.read())

for key, value in data.items():
    if key in 'streams':
        for keyke, valueka in enumerate(value):
            streamername = valueka["channel"]["display_name"]
            cursor.execute("UPDATE `Channels` SET `Status` = 1, `Updated` = NOW() WHERE `Name` = '%s' AND `Status` = 0" % streamername)
            cursor.fetchone()
            db.commit()

            if cursor.rowcount == 1:
                req = urllib2.Request(push_url, "TwitchTV | " + streamername + " just went live!")
                rsp = urllib2.urlopen(req)

            akikstreamelnek = akikstreamelnek + ',\'%s\'' % streamername


akikstreamelnek = "(" + akikstreamelnek[1:] + ")"
cursor.execute("UPDATE `Channels` Set `Status` = 0, `Updated` = NOW() WHERE `Name` NOT IN %s AND `Status` = 1" % akikstreamelnek)
cursor.fetchone()
db.commit()

db.close()
