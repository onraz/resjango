## Django Explore


## Development Setup
Ensure following is installed
- pyenv 
  - Can be installed for MAC using `brew install pyenv`
  - Python version is managed using pyenv and the `.python-version`
- poetry
  - Can be installed for MAC using `brew install pipx` and then `pipx install poetry`

```shell
poetry install
poetry run pre-commit install
```

## How to Run
Running the application

```shell
poetry run python src/manage.py runserver
```

The application then can be accessed at http://127.0.0.1:8000/

### Running using Docker
```shell
docker compose up
```
The application then can be accessed at http://127.0.0.1:8000/

## Dependencies Used
- Django 
  - for application/web framework
- Django-rest
  - for REST framework
