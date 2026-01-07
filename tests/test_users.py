# test_models.py
import pytest


@pytest.mark.django_db
def test_project_duration(create_test_user, create_test_question) -> None:  # use the project fixture as a param
    assert create_test_user.username == "testuser"
    assert create_test_question is not None
