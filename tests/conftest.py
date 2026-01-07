# conftest.py
import pytest
from django.contrib.auth.models import User
from polls.models import Question
from datetime import datetime, timezone

@pytest.fixture
def create_test_user():
    """Creates a standard test user."""
    user = User.objects.create_user(username='testuser', password='testpassword')
    return user

@pytest.fixture
def api_client():
   """A Django REST Framework API client instance."""
   from rest_framework.test import APIClient
   return APIClient()

@pytest.fixture
def create_test_question():
    pass
    question = Question.objects.create(question_text='etc', pub_date=datetime.now(timezone.utc))
    return question
