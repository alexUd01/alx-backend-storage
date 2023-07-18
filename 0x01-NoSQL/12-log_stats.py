#!/usr/bin/env python3
""" A python script that provides some stats about Nginx logs stored in MongoDB
"""
from pymongo import MongoClient


def connect_to_db(host='127.0.0.1', port=27017):
    """ A function that establishes a connection to a MongoDB database """
    client: MongoClient = MongoClient('mongodb://{:s}:{:d}'.format(host, port))
    return client.logs.nginx


def main() -> None:
    """
    A function that parses the data from the `nginx` collections
    in the `logs` database
    """
    collection = connect_to_db()

    print("{:d} logs".format(collection.count_documents({})))
    print("Methods:")
    print("    method GET: {:d}".format(
        collection.count_documents({"method": "GET"})))
    print("    method POST: {:d}".format(
        collection.count_documents({"method": "POST"})))
    print("    method PUT: {:d}".format(
        collection.count_documents({"method": "PUT"})))
    print("    method PATCH: {:d}".format(
        collection.count_documents({"method": "PATCH"})))
    print("    method DELETE: {:d}".format(
        collection.count_documents({"method": "DELETE"})))
    print("{:d} status check".format(
        collection.count_documents({"path": "/status"})))


if __name__ == "__main__":
    main()
