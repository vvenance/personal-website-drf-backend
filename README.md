# personal-website-drf-backend

 This project is a lite [Django Rest Framework](https://www.django-rest-framework.org/) backend for personal websites.
## Getting started

### What is assumed

- you know how to use the [command line interface](https://en.wikipedia.org/wiki/Command-line_interface) of your operating system
- python and pip already are installed. If not follow [these guidelines](https://www.makeuseof.com/tag/install-pip-for-python/)
- virtualenv package is installed. If not follow [these guidelines](https://virtualenv.pypa.io/en/latest/installation/)
- you already are familiar with [Python](https://www.python.org/) and [Django](https://www.djangoproject.com/) and by extension the [Django Rest Framework](https://www.django-rest-framework.org/)

### Let's go! (local run)

- git clone the project
- go inside the new folder
- `$ virtualenv env`
- `$ source env/bin/activate`  (On Windows use `env\Scripts\activate`)
- `$ pip install r requirements.txt`
- `$ python manage.py migrate`
- `$ python manage.py runserver`

You can try your new local application by visiting http://127.0.0.1:8000/ on your favorite browser

### Application principles

This app exposes all it's ressources via GET methods, and dosen't requires any credentials to do so.

For any data change (POST, PATCH, PUT, DELETE) you must provide credentials.

To create an admin user :

`$ python manage.py createsuperuser --email your-email@domain.com --username your-username`

To create new entry as an authenticated user, you can use:

- [httpie](https://httpie.org/#installation):  `$ http -a username:password POST http://127.0.0.1:8000/entries/ key="value"`
- [postman](https://learning.getpostman.com/docs/postman/launching_postman/installation_and_updates/):  create a new POST request, below **Authorization** select **Basic Auth**, then provide your credentials. Below **Body** select **JSON (application/json)** and edit the body with your keys and value then press the **SEND** button on the top right
- [cURL](https://curl.haxx.se/download.html): 
```
$ curl --header "Content-Type: application/json" \
 --request POST \
 -u username:password \
 --data '{"key":"value"}' \
 http://127.0.0.1:8000/entries/
 ```
 
 ### What you must check
 
 Use the same env var names as I do in settings.py, or overrride them to use custom var names
 By default the ALLOWED_HOSTS value is set to everything (\*), make sure this is the behaviour you want or override it in settings.py .
 

Happy coding !
