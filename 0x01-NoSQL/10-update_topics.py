#!/usr/bin/env python3
""" A python module that contains a function that changes all topics of
a school document based on the name

PROTOTYPE:
- def update_topics(mongo_collection, name, topics):
- mongo_collection will be the pymongo collection object
- name (string) will be the school name to update
- topics (list of strings) will be the list of topics approached in the school
"""
from pymongo.collection import Collection
from typing import List


def update_topics(mongo_collection: Collection, name: str,
                  topics: List[str]) -> None:
    """ The function """
    mongo_collection.update_many({"name": name}, {"$set": {"topics": topics}})
