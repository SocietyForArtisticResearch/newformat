# coding: utf-8

from __future__ import absolute_import
from datetime import date, datetime  # noqa: F401

from typing import List, Dict  # noqa: F401

from swagger_server.models.base_model_ import Model
from swagger_server import util


class MultiLangString(Model):
    """NOTE: This class is auto generated by the swagger code generator program.

    Do not edit the class manually.
    """
    def __init__(self, lang: str=None, value: str=None):  # noqa: E501
        """MultiLangString - a model defined in Swagger

        :param lang: The lang of this MultiLangString.  # noqa: E501
        :type lang: str
        :param value: The value of this MultiLangString.  # noqa: E501
        :type value: str
        """
        self.swagger_types = {
            'lang': str,
            'value': str
        }

        self.attribute_map = {
            'lang': 'lang',
            'value': 'value'
        }
        self._lang = lang
        self._value = value

    @classmethod
    def from_dict(cls, dikt) -> 'MultiLangString':
        """Returns the dict as a model

        :param dikt: A dict.
        :type: dict
        :return: The MultiLangString of this MultiLangString.  # noqa: E501
        :rtype: MultiLangString
        """
        return util.deserialize_model(dikt, cls)

    @property
    def lang(self) -> str:
        """Gets the lang of this MultiLangString.


        :return: The lang of this MultiLangString.
        :rtype: str
        """
        return self._lang

    @lang.setter
    def lang(self, lang: str):
        """Sets the lang of this MultiLangString.


        :param lang: The lang of this MultiLangString.
        :type lang: str
        """
        if lang is None:
            raise ValueError("Invalid value for `lang`, must not be `None`")  # noqa: E501

        self._lang = lang

    @property
    def value(self) -> str:
        """Gets the value of this MultiLangString.


        :return: The value of this MultiLangString.
        :rtype: str
        """
        return self._value

    @value.setter
    def value(self, value: str):
        """Sets the value of this MultiLangString.


        :param value: The value of this MultiLangString.
        :type value: str
        """
        if value is None:
            raise ValueError("Invalid value for `value`, must not be `None`")  # noqa: E501

        self._value = value