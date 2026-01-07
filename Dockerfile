# Python image used for all stages
ARG PYTHON_IMAGE=python:3.14-slim

# =========================
# Stage 1: Builder
# =========================
FROM $PYTHON_IMAGE AS builder

# Prevent Python from writing pyc files and buffering stdout
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Install Poetry
RUN pip install --no-cache-dir poetry

WORKDIR /app

# Copy dependency definitions first for better layer caching
COPY pyproject.toml poetry.lock ./

# Configure Poetry to create venv inside project
RUN poetry config virtualenvs.in-project true

# Install dependencies (no project code yet)
RUN poetry install --no-root --no-interaction --no-ansi

# Copy application source
COPY src ./src

# =========================
# Stage 2: Runtime
# =========================
FROM $PYTHON_IMAGE AS runtime

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/app/.venv/bin:$PATH"

# Create a non-root user
RUN groupadd --system appuser \
    && useradd --system --gid appuser --home /app appuser

WORKDIR /app

# Copy virtualenv and app from builder
COPY --from=builder /app /app

# Fix ownership
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Expose Django port
EXPOSE 8000

# =========================
# Runtime command
# =========================

# Development (Django runserver)
CMD ["python", "src/manage.py", "runserver", "0.0.0.0:8000"]