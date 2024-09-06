# Python program to write JSON
# to a file
import json

def makeJson(title, subTitle):
    # Data to be written
    print("creating json with "+title+", "+subTitle)
    dictionary ={
        "aps" : {
            "alert" : {
                "title" : title,
                "body" : subTitle
            },
            "badge" : 7,
            "Content-available" : "1"
        }
        
    }

    # Serializing json
    json_object = json.dumps(dictionary, indent = 4)

    # Writing to sample.json
    with open("notification.json", "w") as outfile:
        outfile.write(json_object)



