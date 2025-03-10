from django.contrib import admin
from django.urls import path, include
from django.http import JsonResponse

def home(request):
    return JsonResponse({"message": "Welcome to Doctor Consultant API!"})

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('users.urls')),
    path('products/', include('products.urls')),
    path('', home),  # Бул линия башкы маршрут үчүн
]
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)