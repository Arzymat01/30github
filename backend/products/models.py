from django.db import models
from django.contrib.auth import get_user_model

User = get_user_model()

class Product(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)  # Колдонуучу менен байланыштыруу
    name = models.CharField(max_length=255)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    image = models.ImageField(upload_to='product_images/')
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name
