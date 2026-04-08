from django.urls import path
from . import views

urlpatterns = [
    path("api/personas", views.PersonaListCreate.as_view(), name="persona-list"),
    path("api/personas/<int:pk>", views.PersonaDetail.as_view(), name="persona-detail"),
]
