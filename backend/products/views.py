from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from .models import Product
from .forms import ProductForm

@login_required
def upload_product(request):
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            product = form.save(commit=False)
            product.user = request.user  # Колдонуучуну байлоо
            product.save()
            return redirect('product_list')  # Продукттар тизмесине өтүү
    else:
        form = ProductForm()
    
    return render(request, 'products/upload.html', {'form': form})

@login_required
def product_list(request):
    products = Product.objects.filter(user=request.user)  # Колдонуучунун продукттарын көрсөтүү
    return render(request, 'products/product_list.html', {'products': products})

@login_required
def delete_product(request, product_id):
    product = get_object_or_404(Product, id=product_id, user=request.user)  # Колдонуучунун продуктусу гана өчөт
    product.delete()
    return redirect('product_list')
