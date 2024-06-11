#!/bin/bash

echo "----- Collect static files ------ " 
python manage.py collectstatic --noinput

# Create superuser
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'adminpassword')" | python manage.py shell

echo "-----------Apply migration--------- "
python manage.py makemigrations 
python manage.py migrate

echo "-----------Run gunicorn--------- "
gunicorn dcrm.wsgi:application --bind 0.0.0.0:8000