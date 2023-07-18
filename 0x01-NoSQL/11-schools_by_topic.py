#!/usr/bin/env python3
"""A python module that contains a function that returns a list of school
having a specific topic

PROTOTYPE:
- schools_by_topic(mongo_collection, topic):
- mongo_collection will be the pymongo collection object
- topic (string) will be topic searched
"""


def schools_by_topic(mongo_collection, topic):
    """ The function """
    return list(mongo_collection.find({"topics": topic}))
