from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from .forms import RegistrationForm

def register(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.set_password(form.cleaned_data['password'])
            user.save()
            return redirect('login')  # Кирүү бетине өтүү
    else:
        form = RegistrationForm()
    return render(request, 'register.html', {'form': form})
