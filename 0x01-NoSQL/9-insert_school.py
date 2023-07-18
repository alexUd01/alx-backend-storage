#!/usr/bin/env python3
""" A python module that contains a function that inserts a new document in
a colleoction
"""
import pymongo


def insert_school(mongo_collection: pymongo.collection.Collection,
                  **kwargs: dict) -> str:
    """ The function """
    obj = mongo_collection.insert_one(kwargs)
    return obj.inserted_id
