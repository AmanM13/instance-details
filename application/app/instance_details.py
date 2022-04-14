import os
import boto3
from botocore.config import Config
from flask import Flask

app = Flask(__name__)

CHECK = "RUNNING"

@app.route("/ec2")
def ec2_instances_details():
    print(f"Check for status: {CHECK}")
    
    # Creating a list of required regions
    regions = [
    'us-east-1'
    ]
   
    # Initializing a list to store the details of running instances
    main_list=[]

    # Check status of EC2 in region
    cnt = 0
    for region in regions:

        # Change regions with config
        my_config = Config(region_name=region)
        client = boto3.client("ec2", config=my_config)
        # Getting instance details
        response = client.describe_instances()

        for r in response["Reservations"]:
            temp_dictionary={}
            instance_id="NA"
            public_ip_address="NA"
            private_ip_address="NA"
            tags="NA"
            status = r["Instances"][0]["State"]["Name"]
            
            # Checking if the instance is running. If yes, then get the instance id, public and private IP addresses, and tags associated with the instance, if applicable.
            if status == "running":
                try :
                    instance_id = r["Instances"][0]["InstanceId"]
                except:
                    pass    
                try :
                    public_ip_address = r["Instances"][0]["PublicIpAddress"]
                except:
                    pass  
                try :
                    private_ip_address = r["Instances"][0]["PrivateIpAddress"]
                except:
                    pass
                try :
                    tags = r["Instances"][0]["Tags"]
                except:
                    pass    
                print(f"id: {instance_id}, public_ip_address: {public_ip_address}, private_ip_address: {private_ip_address}, tags: {tags} ")
                # Incrementing the count variable to keep a count of running instances
                cnt += 1
                # Saving the details of instance in form of a key-value pairs.
                temp_dictionary["instance_id"]=instance_id
                temp_dictionary["public_ip_address"]=public_ip_address
                temp_dictionary["private_ip_address"]=private_ip_address
                temp_dictionary["tags"]=tags

                main_list.append(temp_dictionary) 
    
    # Logging the no of instances running
    if cnt == 1:
        print(f"{cnt} instance is {CHECK}!")
    elif cnt > 1:
        print(f"{cnt} instances are {CHECK}!")
    else:
        print(f"No instance is {CHECK}!")
    return {"data":main_list}

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8000)))
