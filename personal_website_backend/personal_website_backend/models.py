# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Entry(models.Model):
    entry_url = models.CharField(max_length=1000, null=True, blank=True)
    entry_name = models.CharField(max_length=1000, null=True, blank=True)
    entry_short_desc = models.CharField(max_length=2000, null=True, blank=True)
    entry_media_url = models.CharField(max_length=1000, null=True, blank=True)