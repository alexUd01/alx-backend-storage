#!/usr/bin/env python3
""" A python module that contains a function that inserts a new document in
a colleoction
"""


def insert_school(mongo_collection, **kwargs: dict):
    """ The function """
    obj = mongo_collection.insert_one(kwargs)
    return obj.inserted_id
