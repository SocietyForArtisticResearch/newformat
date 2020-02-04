# coding: utf-8

from __future__ import absolute_import
from datetime import date, datetime  # noqa: F401

from typing import List, Dict  # noqa: F401

from swagger_server.models.base_model_ import Model
from swagger_server.models.object_pointer import ObjectPointer  # noqa: F401,E501
from swagger_server import util


class Connection(Model):
    """NOTE: This class is auto generated by the swagger code generator program.

    Do not edit the class manually.
    """
    def __init__(self, id: str=None, subject: ObjectPointer=None, predicate: str=None, object: ObjectPointer=None):  # noqa: E501
        """Connection - a model defined in Swagger

        :param id: The id of this Connection.  # noqa: E501
        :type id: str
        :param subject: The subject of this Connection.  # noqa: E501
        :type subject: ObjectPointer
        :param predicate: The predicate of this Connection.  # noqa: E501
        :type predicate: str
        :param object: The object of this Connection.  # noqa: E501
        :type object: ObjectPointer
        """
        self.swagger_types = {
            'id': str,
            'subject': ObjectPointer,
            'predicate': str,
            'object': ObjectPointer
        }

        self.attribute_map = {
            'id': 'id',
            'subject': 'subject',
            'predicate': 'predicate',
            'object': 'object'
        }
        self._id = id
        self._subject = subject
        self._predicate = predicate
        self._object = object

    @classmethod
    def from_dict(cls, dikt) -> 'Connection':
        """Returns the dict as a model

        :param dikt: A dict.
        :type: dict
        :return: The Connection of this Connection.  # noqa: E501
        :rtype: Connection
        """
        return util.deserialize_model(dikt, cls)

    @property
    def id(self) -> str:
        """Gets the id of this Connection.

        The id of the connection  # noqa: E501

        :return: The id of this Connection.
        :rtype: str
        """
        return self._id

    @id.setter
    def id(self, id: str):
        """Sets the id of this Connection.

        The id of the connection  # noqa: E501

        :param id: The id of this Connection.
        :type id: str
        """

        self._id = id

    @property
    def subject(self) -> ObjectPointer:
        """Gets the subject of this Connection.


        :return: The subject of this Connection.
        :rtype: ObjectPointer
        """
        return self._subject

    @subject.setter
    def subject(self, subject: ObjectPointer):
        """Sets the subject of this Connection.


        :param subject: The subject of this Connection.
        :type subject: ObjectPointer
        """
        if subject is None:
            raise ValueError("Invalid value for `subject`, must not be `None`")  # noqa: E501

        self._subject = subject

    @property
    def predicate(self) -> str:
        """Gets the predicate of this Connection.

        Id of a predicate. Predicates can be retrieved from /predicates  # noqa: E501

        :return: The predicate of this Connection.
        :rtype: str
        """
        return self._predicate

    @predicate.setter
    def predicate(self, predicate: str):
        """Sets the predicate of this Connection.

        Id of a predicate. Predicates can be retrieved from /predicates  # noqa: E501

        :param predicate: The predicate of this Connection.
        :type predicate: str
        """
        if predicate is None:
            raise ValueError("Invalid value for `predicate`, must not be `None`")  # noqa: E501

        self._predicate = predicate

    @property
    def object(self) -> ObjectPointer:
        """Gets the object of this Connection.


        :return: The object of this Connection.
        :rtype: ObjectPointer
        """
        return self._object

    @object.setter
    def object(self, object: ObjectPointer):
        """Sets the object of this Connection.


        :param object: The object of this Connection.
        :type object: ObjectPointer
        """
        if object is None:
            raise ValueError("Invalid value for `object`, must not be `None`")  # noqa: E501

        self._object = object