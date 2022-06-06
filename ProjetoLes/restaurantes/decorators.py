from django.http import HttpResponse
from django.shortcuts import redirect
import funcionarios.views

def IsLoggedIn(view_func):
    def wraper_func(request, *args, **kwargs):
        if 'isLogin' in request.session:
            if request.session['isLogin'] and request.session['isLogin'] != 1:
                return redirect('Login')
        else:
            return redirect(funcionarios.views.Login)
        return view_func(request, *args, **kwargs)
    return wraper_func


#vai passar Administrador
def allowed_users(allowed_user=[]):
    def decorator(view_func):
        def wraper_func(request, *args, **kwargs):
            if 'tipofunc' in request.session:
                for user in allowed_user:
                    if request.session['tipofunc'] and request.session['tipofunc'] == user:
                        return view_func(request, *args, **kwargs)
            return redirect(funcionarios.views.Login)
        return wraper_func
    return decorator