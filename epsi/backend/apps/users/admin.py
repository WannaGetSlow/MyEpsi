from django.contrib import admin
from .models import Module, News, Program, Event

admin.site.register(Module)
admin.site.register(News)
admin.site.register(Program)
admin.site.register(Event)