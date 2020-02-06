# coding: utf-8

from __future__ import absolute_import

from flask import json
from six import BytesIO

from swagger_server.models.media_record import MediaRecord  # noqa: E501
from swagger_server.test import BaseTestCase


class TestServiceController(BaseTestCase):
    """ServiceController integration test stubs"""

    def test_get_public_media_index(self):
        """Test case for get_public_media_index

        Get all publicly available media records. May produce large amounts of data.
        """
        response = self.client.open(
            '/media/index/public',
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))


if __name__ == '__main__':
    import unittest
    unittest.main()
