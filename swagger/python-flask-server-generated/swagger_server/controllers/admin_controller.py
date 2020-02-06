import connexion
import six

from swagger_server.models.predicate import Predicate  # noqa: E501
from swagger_server.models.vocabulary_term import VocabularyTerm  # noqa: E501
from swagger_server import util


def delete_keywords_closed(keyword_id):  # noqa: E501
    """Delete a keyword. Backend needs to delete all uses of it.

     # noqa: E501

    :param keyword_id: id of keyword
    :type keyword_id: str

    :rtype: None
    """
    return 'do some magic!'


def delete_predicate(predicate_id):  # noqa: E501
    """Delete an existing predicate.

     # noqa: E501

    :param predicate_id: id of a predicate
    :type predicate_id: str

    :rtype: None
    """
    return 'do some magic!'


def post_keywords_closed(body):  # noqa: E501
    """create a new keyword

     # noqa: E501

    :param body: 
    :type body: dict | bytes

    :rtype: VocabularyTerm
    """
    if connexion.request.is_json:
        body = VocabularyTerm.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'


def post_predicate(body):  # noqa: E501
    """Define a new predicate.

     # noqa: E501

    :param body: 
    :type body: dict | bytes

    :rtype: Predicate
    """
    if connexion.request.is_json:
        body = Predicate.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'


def put_keywords_closed(body, keyword_id):  # noqa: E501
    """update a keyword

     # noqa: E501

    :param body: 
    :type body: dict | bytes
    :param keyword_id: id of keyword
    :type keyword_id: str

    :rtype: None
    """
    if connexion.request.is_json:
        body = VocabularyTerm.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'


def put_predicate(body, predicate_id):  # noqa: E501
    """Update an existing predicate.

     # noqa: E501

    :param body: 
    :type body: dict | bytes
    :param predicate_id: id of a predicate
    :type predicate_id: str

    :rtype: None
    """
    if connexion.request.is_json:
        body = Predicate.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'
