#!/usr/bin/env python3
""" A python script that contains a function that returns all students
sorted by average score

PROTOTYPE:
- def top_students(mongo_collection):
- `mongo_collection` will be the pymongo collection object
- The top must be ordered
- The average score must be part of each item returns with
  key = `averageScore`
"""
from functools import reduce


def top_students(mongo_collection):
    """ The function """
    all_students = list(mongo_collection.find())

    # compute and append average
    for student in all_students:
        scores = []
        for topic in student['topics']:
            scores.append(topic['score'])
        student['averageScore'] = sum(scores) / len(scores)

    sorted_list = sorted(all_students,
                         key=lambda student: student['averageScore'],
                         reverse=True)
    return sorted_list[0:50]
