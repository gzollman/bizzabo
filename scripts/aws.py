def isPagination(PaginationToken):
    if(PaginationToken != ""):
        return False
    else:
        return True  


import boto3
import re
region = input('AWS Region >').lower()
client = boto3.client('resourcegroupstaggingapi', region)
used_resources = []
done = False
command = input('AWS Service >').lower()

if(command == 'all'):
    response = client.get_resources()
    while(not done):
        resourceTagMappingList = response['ResourceTagMappingList']
        for i in resourceTagMappingList:
            used_resources.append((re.search("arn:aws:(\w*):", i['ResourceARN']).group(1)))
        
        done = isPagination(response['PaginationToken'])
        response = client.get_resources(PaginationToken=response['PaginationToken'])
    print(list(dict.fromkeys(used_resources)))
else:
    response = client.get_resources(ResourceTypeFilters=[command])
    while(not done):
        used_resources = used_resources + response['ResourceTagMappingList']
        done = isPagination(response['PaginationToken'])
        response = client.get_resources(PaginationToken=response['PaginationToken'])
    print(used_resources)