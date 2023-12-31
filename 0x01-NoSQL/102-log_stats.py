#!/usr/bin/env python3
""" A python script that improves `12-log_stats.py` by providing the top 10 of
the most present IPs in the collection `nginx` of the database `logs`

- The IPs top must be sorted (descending order)
"""
from pymongo import MongoClient


def connect_to_db(host='127.0.0.1', port=27017):
    """ A function that establishes a connection to a MongoDB database """
    client = MongoClient('mongodb://{:s}:{:d}'.format(host, port))
    return client.logs.nginx


def create_stat(collection, num=10):
    """ A function that computes the number of requests made by each
    ip address to the nginx server
    """
    result = {}
    for item in collection:
        if item['ip'] in result.keys():
            result[item['ip']] += 1
        else:
            result[item['ip']] = 1

    lst_of_tups = sorted(result.items(), key=lambda item: item[1],
                         reverse=True)[0:num]
    return dict(lst_of_tups)


def main():
    """
    A function that parses the data from the `nginx` collections
    in the `logs` database
    """
    collection = connect_to_db()

    print("{:d} logs".format(collection.count_documents({})))

    # Methods:
    print("Methods:")
    print("\tmethod GET: {:d}".format(
        collection.count_documents({"method": "GET"})))
    print("\tmethod POST: {:d}".format(
        collection.count_documents({"method": "POST"})))
    print("\tmethod PUT: {:d}".format(
        collection.count_documents({"method": "PUT"})))
    print("\tmethod PATCH: {:d}".format(
        collection.count_documents({"method": "PATCH"})))
    print("\tmethod DELETE: {:d}".format(
        collection.count_documents({"method": "DELETE"})))
    print("{:d} status check".format(
        collection.count_documents({"path": "/status"})))

    # IPs:
    print("IPs:")
    ip_stats = create_stat(list(collection.find()))
    for ip, no_of_requests in ip_stats.items():
        print("\t{:s}: {:d}".format(ip, no_of_requests))


if __name__ == "__main__":
    main()
