from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from django.http import JsonResponse
from django.views import View
import json

# Катталуу
class RegisterView(View):
    def post(self, request):
        data = json.loads(request.body)
        username = data.get("username")
        password = data.get("password")

        if not username or not password:
            return JsonResponse({"error": "Маалыматтар толук эмес"}, status=400)

        if User.objects.filter(username=username).exists():
            return JsonResponse({"error": "Бул колдонуучу мурун катталган"}, status=400)

        user = User.objects.create_user(username=username, password=password)
        return JsonResponse({"message": "Каттоо ийгиликтүү аяктады"})

# Кирүү
class LoginView(View):
    def post(self, request):
        data = json.loads(request.body)
        username = data.get("username")
        password = data.get("password")

        user = authenticate(username=username, password=password)
        if user:
            login(request, user)
            return JsonResponse({"message": "Кирүү ийгиликтүү!"})
        return JsonResponse({"error": "Логин же сырсөз туура эмес"}, status=400)
