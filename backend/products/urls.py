from django.urls import path
from .views import upload_product, product_list, delete_product

urlpatterns = [
    path('upload/', upload_product, name='upload_product'),
    path('', product_list, name='product_list'),
    path('delete/<int:product_id>/', delete_product, name='delete_product'),
]
