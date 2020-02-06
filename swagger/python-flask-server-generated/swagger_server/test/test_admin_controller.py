# coding: utf-8

from __future__ import absolute_import

from flask import json
from six import BytesIO

from swagger_server.models.predicate import Predicate  # noqa: E501
from swagger_server.models.vocabulary_term import VocabularyTerm  # noqa: E501
from swagger_server.test import BaseTestCase


class TestAdminController(BaseTestCase):
    """AdminController integration test stubs"""

    def test_delete_keywords_closed(self):
        """Test case for delete_keywords_closed

        Delete a keyword. Backend needs to delete all uses of it.
        """
        response = self.client.open(
            '/keywords/closed/{keywordId}'.format(keyword_id='keyword_id_example'),
            method='DELETE')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_delete_predicate(self):
        """Test case for delete_predicate

        Delete an existing predicate.
        """
        response = self.client.open(
            '/predicates/{predicateId}'.format(predicate_id='predicate_id_example'),
            method='DELETE')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_post_keywords_closed(self):
        """Test case for post_keywords_closed

        create a new keyword
        """
        body = VocabularyTerm()
        response = self.client.open(
            '/keywords/closed',
            method='POST',
            data=json.dumps(body),
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_post_predicate(self):
        """Test case for post_predicate

        Define a new predicate.
        """
        body = Predicate()
        response = self.client.open(
            '/predicates',
            method='POST',
            data=json.dumps(body),
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_put_keywords_closed(self):
        """Test case for put_keywords_closed

        update a keyword
        """
        body = VocabularyTerm()
        response = self.client.open(
            '/keywords/closed/{keywordId}'.format(keyword_id='keyword_id_example'),
            method='PUT',
            data=json.dumps(body),
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_put_predicate(self):
        """Test case for put_predicate

        Update an existing predicate.
        """
        body = Predicate()
        response = self.client.open(
            '/predicates/{predicateId}'.format(predicate_id='predicate_id_example'),
            method='PUT',
            data=json.dumps(body),
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))


if __name__ == '__main__':
    import unittest
    unittest.main()
