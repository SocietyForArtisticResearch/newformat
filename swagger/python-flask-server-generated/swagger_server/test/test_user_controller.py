# coding: utf-8

from __future__ import absolute_import

from flask import json
from six import BytesIO

from swagger_server.models.connection import Connection  # noqa: E501
from swagger_server.models.license import License  # noqa: E501
from swagger_server.models.media_record import MediaRecord  # noqa: E501
from swagger_server.models.open_vocabulary_term import OpenVocabularyTerm  # noqa: E501
from swagger_server.models.predicate import Predicate  # noqa: E501
from swagger_server.models.problem_with_rc_object import ProblemWithRCObject  # noqa: E501
from swagger_server.models.search_request import SearchRequest  # noqa: E501
from swagger_server.models.share_status import ShareStatus  # noqa: E501
from swagger_server.models.storage_usage import StorageUsage  # noqa: E501
from swagger_server.models.vocabulary_term import VocabularyTerm  # noqa: E501
from swagger_server.test import BaseTestCase


class TestUserController(BaseTestCase):
    """UserController integration test stubs"""

    def test_delete_connection(self):
        """Test case for delete_connection

        Delete a connection
        """
        response = self.client.open(
            '/connection/{connectionId}'.format(connection_id='connection_id_example'),
            method='DELETE')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_delete_keywords_open(self):
        """Test case for delete_keywords_open

        deletes a keyword from the open vocabulary (case insensitive)
        """
        response = self.client.open(
            '/keywords/open/{openKeywordId}'.format(open_keyword_id='open_keyword_id_example'),
            method='DELETE')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_delete_tag(self):
        """Test case for delete_tag

        Deletes a tag from the user's list of tags. User is identified from header 
        """
        response = self.client.open(
            '/tags/{tagId}'.format(tag_id='tag_id_example'),
            method='DELETE')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_get_connections(self):
        """Test case for get_connections

        Get all connections for which this record is the subject or the object
        """
        response = self.client.open(
            '/media/{mediaId}/connections'.format(media_id='media_id_example'),
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_get_keywords_closed(self):
        """Test case for get_keywords_closed

        Get closed vocabulary keywords
        """
        response = self.client.open(
            '/keywords/closed',
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_get_keywords_open(self):
        """Test case for get_keywords_open

        get open vocabulary keywords, starting with a given string
        """
        query_string = [('starting_with', 'starting_with_example'),
                        ('limit', 56)]
        response = self.client.open(
            '/keywords/open',
            method='GET',
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_get_licenses(self):
        """Test case for get_licenses

        Get all licenses
        """
        response = self.client.open(
            '/licenses',
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_get_media(self):
        """Test case for get_media

        get media record
        """
        response = self.client.open(
            '/media/{mediaId}'.format(media_id='media_id_example'),
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_get_media_children(self):
        """Test case for get_media_children

        get the children of a media record
        """
        response = self.client.open(
            '/media/{mediaId}/children'.format(media_id='media_id_example'),
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_get_media_file(self):
        """Test case for get_media_file

        Get the file of a media record. Will not return a file if the media record is a text object.
        """
        response = self.client.open(
            '/media/{mediaId}/file'.format(media_id='media_id_example'),
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_get_media_index(self):
        """Test case for get_media_index

        get all media accessible to the user
        """
        response = self.client.open(
            '/media/index',
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_get_media_thumb(self):
        """Test case for get_media_thumb

        Get the preview thumbnail of the media record. All media records have a default thumb.
        """
        response = self.client.open(
            '/media/{mediaId}/thumb'.format(media_id='media_id_example'),
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_get_predicates(self):
        """Test case for get_predicates

        Return all defined predicates
        """
        response = self.client.open(
            '/predicates',
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_get_share_status(self):
        """Test case for get_share_status

        get the share status of a media record
        """
        response = self.client.open(
            '/media/{mediaId}/shareStatus'.format(media_id='media_id_example'),
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_get_storage_usage(self):
        """Test case for get_storage_usage

        get the current storage usage of user
        """
        response = self.client.open(
            '/storage/usage',
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_get_tags(self):
        """Test case for get_tags

        get users tags, the user has a set of personal tags user is identified from header 
        """
        response = self.client.open(
            '/tags',
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_get_types(self):
        """Test case for get_types

        gets the id's of type schemas
        """
        response = self.client.open(
            '/types',
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_get_types_schema(self):
        """Test case for get_types_schema

        get the schema of a type
        """
        response = self.client.open(
            '/types/schema/{schemaId}'.format(schema_id='schema_id_example'),
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_media_media_id_delete(self):
        """Test case for media_media_id_delete

        delete media record
        """
        response = self.client.open(
            '/media/{mediaId}'.format(media_id='media_id_example'),
            method='DELETE')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_media_search_post(self):
        """Test case for media_search_post

        Search for media records using the search filter
        """
        body = SearchRequest()
        response = self.client.open(
            '/media/search',
            method='POST',
            data=json.dumps(body),
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_post_connection(self):
        """Test case for post_connection

        Create a connection. The requester needs to have write permission for the subject entity and write or read permission for the object.
        """
        body = Connection()
        response = self.client.open(
            '/connection',
            method='POST',
            data=json.dumps(body),
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_post_keywords_open(self):
        """Test case for post_keywords_open

        add a keyword to the open vocabulary
        """
        body = 'body_example'
        response = self.client.open(
            '/keywords/open',
            method='POST',
            data=json.dumps(body),
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_post_media(self):
        """Test case for post_media

        Post a new media record. The file needs to be uploaded separately.
        """
        body = MediaRecord()
        response = self.client.open(
            '/media',
            method='POST',
            data=json.dumps(body),
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_post_tag(self):
        """Test case for post_tag

        add a tag to the users personal list of tags user is identified from header 
        """
        body = 'body_example'
        response = self.client.open(
            '/tags',
            method='POST',
            data=json.dumps(body),
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_put_connection(self):
        """Test case for put_connection

        Update a connection
        """
        body = Connection()
        response = self.client.open(
            '/connection/{connectionId}'.format(connection_id='connection_id_example'),
            method='PUT',
            data=json.dumps(body),
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_put_media(self):
        """Test case for put_media

        Update a media record
        """
        body = MediaRecord()
        response = self.client.open(
            '/media/{mediaId}'.format(media_id='media_id_example'),
            method='PUT',
            data=json.dumps(body),
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_put_media_file(self):
        """Test case for put_media_file

        Upload media file of media record or replace it if it already exists.
        """
        data = dict(file='file_example')
        response = self.client.open(
            '/media/{mediaId}/file'.format(media_id='media_id_example'),
            method='PUT',
            data=data,
            content_type='multipart/form-data')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_put_media_import_doc(self):
        """Test case for put_media_import_doc

        Import a text document file (word, odt etc..).  The document is converted using Pandoc, which results in text and a subfolder of media. Text is appended to the end of any existing text in the media record. v text record (text converted to markdown)   v media     - illustration1.jpg     - illustration2.jpg     - illustration3.jpg The position of the media is signaled by using the !{name} tokens in the Markdown, and reflected in the connections metadata. 
        """
        data = dict(file='file_example')
        response = self.client.open(
            '/media/{mediaId}/import/doc'.format(media_id='media_id_example'),
            method='PUT',
            data=data,
            content_type='multipart/form-data')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_put_media_import_folder(self):
        """Test case for put_media_import_folder

        Import multiple files at once (flat list, no hierarchy)  Copyright & license inhereted from parent. 
        """
        data = dict(filename='filename_example')
        response = self.client.open(
            '/media/{mediaId}/import/folder'.format(media_id='media_id_example'),
            method='PUT',
            data=data,
            content_type='multipart/form-data')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_put_media_thumb(self):
        """Test case for put_media_thumb

        Replace tge preview thumbail image.
        """
        body = Object()
        response = self.client.open(
            '/media/{mediaId}/thumb'.format(media_id='media_id_example'),
            method='PUT',
            data=json.dumps(body),
            content_type='image/*')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_put_share_status(self):
        """Test case for put_share_status

        put the share status of a media record
        """
        body = ShareStatus()
        response = self.client.open(
            '/media/{mediaId}/shareStatus'.format(media_id='media_id_example'),
            method='PUT',
            data=json.dumps(body),
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))


if __name__ == '__main__':
    import unittest
    unittest.main()
