#!/usr/bin/env python3
""" A module that contains a python function that lists all documents
in a collection
"""


def list_all(mongo_collection):
    """  The function """
    return list(mongo_collection.find())
