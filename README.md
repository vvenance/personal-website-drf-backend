# personal-website-drf-backend

 This project is a lite [Django Rest Framework](https://www.django-rest-framework.org/) backend for personal websites.
## Getting started

### What is assumed

- you know how to use the [command line interface](https://en.wikipedia.org/wiki/Command-line_interface) of your operating system
- python and pip already are installed. If not follow [these guidelines](https://www.makeuseof.com/tag/install-pip-for-python/)
- virtualenv package is installed. If not follow [these guidelines](https://virtualenv.pypa.io/en/latest/installation/)
- you already are familiar with [Python](https://www.python.org/) and [Django](https://www.djangoproject.com/) and by extension the [Django Rest Framework](https://www.django-rest-framework.org/)

### Let's go!

- git clone the project
- go inside the new folder
- `$ virtualenv env`
- `$ source env/bin/activate`  (On Windows use `env\Scripts\activate`)
- `$ pip install django`
- `$ pip install djangorestframework`
- `$ python manage.py makemigrations personal_website_backend`
- `$ python manage.py migrate personal_website_backend`
- `$ python manage.py runserver`

you can try your new local application by visiting http://localhost:9292/ on your favorite browser

Happy coding !
