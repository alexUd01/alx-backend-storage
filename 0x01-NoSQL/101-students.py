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


def top_students(mongo_collection):
    """ The function """
    all_students = list(mongo_collection.find())
    all_students_with_average = map(lambda student:
                                    reduce(lambda t1, t2:
                                           t1['score'] + t2['score'],
                                           student.topics) / len(student.topics),
                                    all_students)
    sorted_list = sorted(all_students_with_average,
                         key=lambda item: item.averageScore,
                         reverse=True)
    return sorted_list[0:5]
