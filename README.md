## Django Explore

A rest backend application using the Django REST framework (DRF), built using poetry.

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
### Tests
```shell
poetry run pytest
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

To modify docker configuration, please see `Dockerfile` and `docker-compose.yml`

## Accessing the API

API overview: http://127.0.0.1:8000/polls

```shell
 curl -H "Accept: application/json" http://127.0.0.1:8000/polls/questions/1 | jq 
```