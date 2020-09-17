# Generated by Django 3.1.1 on 2020-09-17 10:50

import csv
import os
from pathlib import Path

from django.db import IntegrityError, migrations, transaction

BASE_DIR = Path(__file__).resolve().parent.parent.parent


def get_ingredients(apps, schema_editor):
    Ingredient = apps.get_model('recipes', 'Ingredient')

    csv_file = os.path.join(BASE_DIR, 'ingredients.csv')
    data = csv.reader(open(csv_file, encoding='utf-8'), delimiter=',')
    try:
        obj_list = [
            Ingredient(
                id=id,
                title=row[0],
                dimension='г' if row[1] == '' else row[1],
            )
            for id, row in enumerate(data)
        ]
    except (IndexError):
        return 'IndexError'
    try:
        with transaction.atomic():
            Ingredient.objects.bulk_create(obj_list)
    except IntegrityError:
        pass


def delete_ingredients(apps, schema_editor):
    Ingredient = apps.get_model('recipes', 'Ingredient')
    Ingredient.objects.all().delete()


class Migration(migrations.Migration):

    dependencies = [
        ('recipes', '0001_initial'),
    ]

    operations = [
        migrations.RunPython(get_ingredients, reverse_code=delete_ingredients),
    ]