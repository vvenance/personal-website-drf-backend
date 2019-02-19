# personal-website-drf-backend

This project is a lite [Django Rest Framework](https://www.django-rest-framework.org/) backend for personal websites.

An article describes how this project should be used. You can find it on [Clever Cloud's blog](https://www.clever-cloud.com/blog/engineering/2019/02/12/create-an-api-with-python/).

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
 
## Using Clever CLI to deploy (advanced)

This tutorial will use the [Clever Tools CLI](https://www.clever-cloud.com/doc/clever-tools/getting_started/).

It will allow you to create, configure and deploy your application on Clever Cloud from console.

In the following steps, we will suppose that you name (adapt to your needs) in the Clever Cloud dashboard :

* your application : `django-rest-api` 
* your corresponding database add-on : `django-rest-api-pg`

### Create the app and add-on

At the root of the project :

```bash
clever login
```

Log in the UI and close it. Then create your Python application and PostgreSQL add-on :

```bash
clever create --type python --region par django-rest-api
clever addon create --region eu --plan dev --link django-rest-api postgresql-addon django-rest-api-pg
```

More information on parameters [HERE](https://www.clever-cloud.com/doc/clever-tools/create/).

If needed, you can set the scaling :

```bash
clever scale --min-flavor pico --max-flavor pico
clever scale --min-instances 1 --max-instances 1
```

More information on scaling [HERE](https://www.clever-cloud.com/doc/clever-tools/manage/).

### Environment setup

You need to setup some Environment variables accordingly to your `settings.py` :

```bash
clever env set CUSTOM_SECRET_KEY "your_custom_secret_key"
clever env set PRODUCTION "True"
clever env set PORT "8080"
clever env set CC_PYTHON_MODULE "personal_website_backend.wsgi:application"
clever env set PYTHON_BACKEND "uwsgi"
```

More information on Python environement variables [HERE](https://www.clever-cloud.com/doc/python/python_apps/).

### Deploy !

Nothing else left to do, just go on and deploy your app :

```bash
clever deploy
```

Note :

If deployement failed with some error like : 

```bash
django.db.utils.OperationalError: could not translate host name "XXXXXXXXXX-postgresql.services.clever-cloud.com" to address: Name or service not known
```

It only means that you deployed too quickly after creating the PG add-on and name propagation has not yet been done. Wait a bit and try again later.

### URL

Your application automatically has a domain pointing to it. You can obtain it though :

```bash
clever domain
```

To add other domains, more information [HERE](https://www.clever-cloud.com/doc/admin-console/custom-domain-names/).

Happy coding !
