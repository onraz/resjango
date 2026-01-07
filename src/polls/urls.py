from rest_framework.routers import DefaultRouter
from polls.views import QuestionViewSet, ChoiceViewSet

# urlpatterns = [
#     # ex: /polls/
#     path("", views.index, name="index"),
#     # ex: /polls/5/
#     path("<int:question_id>/", views.detail, name="detail"),
#     # ex: /polls/5/results/
#     path("<int:question_id>/results/", views.results, name="results"),
#     # ex: /polls/5/vote/
#     path("<int:question_id>/vote/", views.vote, name="vote"),
# ]

router = DefaultRouter(trailing_slash=False)
router.register(r"questions", QuestionViewSet)
router.register(r"choices", ChoiceViewSet)

urlpatterns = router.urls