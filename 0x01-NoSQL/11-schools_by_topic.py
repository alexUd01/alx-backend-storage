#!/usr/bin/env python3
"""A python module that contains a function that returns a list of school
having a specific topic

PROTOTYPE:
- schools_by_topic(mongo_collection, topic):
- mongo_collection will be the pymongo collection object
- topic (string) will be topic searched
"""
from pymongo.collection import Collection
from pymongo.cursor import Cursor
from typing import List


def schools_by_topic(mongo_collection: Collection,
                     topic: str) -> List[Cursor]:
    """ The function """
    return list(mongo_collection.find({"topics": topic}))
