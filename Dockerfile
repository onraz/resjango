# --- Stage 1: Builder ---
# Use a specific Python base image
FROM python:3.14-slim AS builder

# Install Poetry using pip
RUN pip install "poetry"

WORKDIR /app

# Copy only the configuration files to leverage Docker layer caching
COPY pyproject.toml poetry.lock ./

# Install dependencies, but do not install the project itself yet (--no-root)
RUN poetry install --no-root

# Add the virtual environment to the PATH
ENV PATH="/app/.venv/bin:$PATH"

# Copy the actual source code from your flat layout
# The '.' copies everything from your local context to the container's WORKDIR
COPY src .

# Expose the port Django runs on
EXPOSE 8000

# "poetry run" can be used if poetry is installed in the runtime image,
# otherwise you can just use "python" and ensure the application is in the python path
CMD ["poetry", "run", "python", "manage.py", "runserver", "0.0.0.0:8000"]
# TODO: For production, use Gunicorn instead:
# CMD ["gunicorn", "--bind", "0.0.0.0:8000", "your_project_name.wsgi"]