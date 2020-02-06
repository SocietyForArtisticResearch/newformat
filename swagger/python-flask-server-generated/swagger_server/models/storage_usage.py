# coding: utf-8

from __future__ import absolute_import
from datetime import date, datetime  # noqa: F401

from typing import List, Dict  # noqa: F401

from swagger_server.models.base_model_ import Model
from swagger_server import util


class StorageUsage(Model):
    """NOTE: This class is auto generated by the swagger code generator program.

    Do not edit the class manually.
    """
    def __init__(self, used: float=None, available: float=None):  # noqa: E501
        """StorageUsage - a model defined in Swagger

        :param used: The used of this StorageUsage.  # noqa: E501
        :type used: float
        :param available: The available of this StorageUsage.  # noqa: E501
        :type available: float
        """
        self.swagger_types = {
            'used': float,
            'available': float
        }

        self.attribute_map = {
            'used': 'used',
            'available': 'available'
        }
        self._used = used
        self._available = available

    @classmethod
    def from_dict(cls, dikt) -> 'StorageUsage':
        """Returns the dict as a model

        :param dikt: A dict.
        :type: dict
        :return: The StorageUsage of this StorageUsage.  # noqa: E501
        :rtype: StorageUsage
        """
        return util.deserialize_model(dikt, cls)

    @property
    def used(self) -> float:
        """Gets the used of this StorageUsage.

        used space in kiloBytes  # noqa: E501

        :return: The used of this StorageUsage.
        :rtype: float
        """
        return self._used

    @used.setter
    def used(self, used: float):
        """Sets the used of this StorageUsage.

        used space in kiloBytes  # noqa: E501

        :param used: The used of this StorageUsage.
        :type used: float
        """
        if used is None:
            raise ValueError("Invalid value for `used`, must not be `None`")  # noqa: E501

        self._used = used

    @property
    def available(self) -> float:
        """Gets the available of this StorageUsage.

        available space in kiloBytes  # noqa: E501

        :return: The available of this StorageUsage.
        :rtype: float
        """
        return self._available

    @available.setter
    def available(self, available: float):
        """Sets the available of this StorageUsage.

        available space in kiloBytes  # noqa: E501

        :param available: The available of this StorageUsage.
        :type available: float
        """
        if available is None:
            raise ValueError("Invalid value for `available`, must not be `None`")  # noqa: E501

        self._available = available