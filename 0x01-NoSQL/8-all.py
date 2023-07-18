#!/usr/bin/env python3
""" A module that contains a python function that lists all documents
in a collection
"""
from pymongo.collection import Collection
from typing import List


def list_all(mongo_collection: Collection) -> List[Collection]:
    """  The function """
    return list(mongo_collection.find())
