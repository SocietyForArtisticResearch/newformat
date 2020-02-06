import connexion
import six

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
from swagger_server import util


def delete_connection(connection_id):  # noqa: E501
    """Delete a connection

     # noqa: E501

    :param connection_id: id of a connection
    :type connection_id: str

    :rtype: None
    """
    return 'do some magic!'


def delete_keywords_open(open_keyword_id):  # noqa: E501
    """deletes a keyword from the open vocabulary (case insensitive)

     # noqa: E501

    :param open_keyword_id: id of keyword
    :type open_keyword_id: str

    :rtype: None
    """
    return 'do some magic!'


def delete_tag(tag_id):  # noqa: E501
    """Deletes a tag from the user&#x27;s list of tags. User is identified from header 

     # noqa: E501

    :param tag_id: id of tag
    :type tag_id: str

    :rtype: None
    """
    return 'do some magic!'


def get_connections(media_id):  # noqa: E501
    """Get all connections for which this record is the subject or the object

     # noqa: E501

    :param media_id: id of media record
    :type media_id: str

    :rtype: List[Connection]
    """
    return 'do some magic!'


def get_keywords_closed():  # noqa: E501
    """Get closed vocabulary keywords

     # noqa: E501


    :rtype: List[VocabularyTerm]
    """
    return 'do some magic!'


def get_keywords_open(starting_with=None, limit=None):  # noqa: E501
    """get open vocabulary keywords, starting with a given string

     # noqa: E501

    :param starting_with: filter keywords using this string as start
    :type starting_with: str
    :param limit: maximum number of keywords to return.
    :type limit: int

    :rtype: List[OpenVocabularyTerm]
    """
    return 'do some magic!'


def get_licenses():  # noqa: E501
    """Get all licenses

     # noqa: E501


    :rtype: List[License]
    """
    return 'do some magic!'


def get_media(media_id):  # noqa: E501
    """get media record

     # noqa: E501

    :param media_id: id of media record
    :type media_id: str

    :rtype: MediaRecord
    """
    return 'do some magic!'


def get_media_children(media_id):  # noqa: E501
    """get the children of a media record

     # noqa: E501

    :param media_id: id of media record
    :type media_id: str

    :rtype: List[MediaRecord]
    """
    return 'do some magic!'


def get_media_file(media_id):  # noqa: E501
    """Get the file of a media record. Will not return a file if the media record is a text object.

     # noqa: E501

    :param media_id: id of media record
    :type media_id: str

    :rtype: str
    """
    return 'do some magic!'


def get_media_index():  # noqa: E501
    """get all media accessible to the user

    Get all media accessible to user based on id. User is is derived from token.  # noqa: E501


    :rtype: List[MediaRecord]
    """
    return 'do some magic!'


def get_media_thumb(media_id):  # noqa: E501
    """Get the preview thumbnail of the media record. All media records have a default thumb.

     # noqa: E501

    :param media_id: id of media record
    :type media_id: str

    :rtype: str
    """
    return 'do some magic!'


def get_predicates():  # noqa: E501
    """Return all defined predicates

     # noqa: E501


    :rtype: List[Predicate]
    """
    return 'do some magic!'


def get_share_status(media_id):  # noqa: E501
    """get the share status of a media record

     # noqa: E501

    :param media_id: id of media record
    :type media_id: str

    :rtype: ShareStatus
    """
    return 'do some magic!'


def get_storage_usage():  # noqa: E501
    """get the current storage usage of user

     # noqa: E501


    :rtype: StorageUsage
    """
    return 'do some magic!'


def get_tags():  # noqa: E501
    """get users tags, the user has a set of personal tags user is identified from header 

     # noqa: E501


    :rtype: List[OpenVocabularyTerm]
    """
    return 'do some magic!'


def get_types():  # noqa: E501
    """gets the id&#x27;s of type schemas

     # noqa: E501


    :rtype: List[str]
    """
    return 'do some magic!'


def get_types_schema(schema_id):  # noqa: E501
    """get the schema of a type

     # noqa: E501

    :param schema_id: id of schema
    :type schema_id: str

    :rtype: object
    """
    return 'do some magic!'


def media_media_id_delete(media_id):  # noqa: E501
    """delete media record

    deletes a media record and also the respective share status object. It cannot be deleted if media record is used in exposition. # noqa: E501

    :param media_id: id of media record
    :type media_id: str

    :rtype: None
    """
    return 'do some magic!'


def media_search_post(body):  # noqa: E501
    """Search for media records using the search filter

     # noqa: E501

    :param body: 
    :type body: dict | bytes

    :rtype: List[MediaRecord]
    """
    if connexion.request.is_json:
        body = SearchRequest.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'


def post_connection(body):  # noqa: E501
    """Create a connection. The requester needs to have write permission for the subject entity and write or read permission for the object.

     # noqa: E501

    :param body: 
    :type body: dict | bytes

    :rtype: None
    """
    if connexion.request.is_json:
        body = Connection.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'


def post_keywords_open(body):  # noqa: E501
    """add a keyword to the open vocabulary

     # noqa: E501

    :param body: keyword as string
    :type body: dict | bytes

    :rtype: OpenVocabularyTerm
    """
    if connexion.request.is_json:
        body = str.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'


def post_media(body):  # noqa: E501
    """Post a new media record. The file needs to be uploaded separately.

    Upload a media file, providing the required fields returns the id of the media. A ShareStatus object is created automatically for this media record. # noqa: E501

    :param body: 
    :type body: dict | bytes

    :rtype: MediaRecord
    """
    if connexion.request.is_json:
        body = MediaRecord.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'


def post_tag(body):  # noqa: E501
    """add a tag to the users personal list of tags user is identified from header 

     # noqa: E501

    :param body: tag as string
    :type body: dict | bytes

    :rtype: OpenVocabularyTerm
    """
    if connexion.request.is_json:
        body = str.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'


def put_connection(body, connection_id):  # noqa: E501
    """Update a connection

     # noqa: E501

    :param body: 
    :type body: dict | bytes
    :param connection_id: id of a connection
    :type connection_id: str

    :rtype: None
    """
    if connexion.request.is_json:
        body = Connection.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'


def put_media(body, media_id):  # noqa: E501
    """Update a media record

    Every time the text of a media record is edited or created, the markdown has to be parsed to recompute relationships between that markdown and the media records it references through !{} notation.  # noqa: E501

    :param body: 
    :type body: dict | bytes
    :param media_id: id of media record
    :type media_id: str

    :rtype: MediaRecord
    """
    if connexion.request.is_json:
        body = MediaRecord.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'


def put_media_file(file, media_id):  # noqa: E501
    """Upload media file of media record or replace it if it already exists.

     # noqa: E501

    :param file: 
    :type file: strstr
    :param media_id: id of media record
    :type media_id: str

    :rtype: None
    """
    return 'do some magic!'


def put_media_import_doc(file, media_id):  # noqa: E501
    """Import a text document file (word, odt etc..).  The document is converted using Pandoc, which results in text and a subfolder of media. Text is appended to the end of any existing text in the media record. v text record (text converted to markdown)   v media     - illustration1.jpg     - illustration2.jpg     - illustration3.jpg The position of the media is signaled by using the !{name} tokens in the Markdown, and reflected in the connections metadata. 

     # noqa: E501

    :param file: 
    :type file: strstr
    :param media_id: id of media record
    :type media_id: str

    :rtype: MediaRecord
    """
    return 'do some magic!'


def put_media_import_folder(media_id, filename=None):  # noqa: E501
    """Import multiple files at once (flat list, no hierarchy)  Copyright &amp; license inhereted from parent. 

     # noqa: E501

    :param media_id: id of media record
    :type media_id: str
    :param filename: 
    :type filename: List[strstr]

    :rtype: MediaRecord
    """
    return 'do some magic!'


def put_media_thumb(body, media_id):  # noqa: E501
    """Replace tge preview thumbail image.

     # noqa: E501

    :param body: 
    :type body: dict | bytes
    :param media_id: id of media record
    :type media_id: str

    :rtype: None
    """
    if connexion.request.is_json:
        body = Object.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'


def put_share_status(body, media_id):  # noqa: E501
    """put the share status of a media record

     # noqa: E501

    :param body: 
    :type body: dict | bytes
    :param media_id: id of media record
    :type media_id: str

    :rtype: ShareStatus
    """
    if connexion.request.is_json:
        body = ShareStatus.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'
