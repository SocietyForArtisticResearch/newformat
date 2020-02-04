import connexion
import six

from swagger_server.models.media_record import MediaRecord  # noqa: E501
from swagger_server import util


def get_public_media_index():  # noqa: E501
    """Get all publicly available media records. May produce large amounts of data.

     # noqa: E501


    :rtype: List[MediaRecord]
    """
    return 'do some magic!'
