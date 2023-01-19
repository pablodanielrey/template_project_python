#
# Development Build
# 
FROM python:3.10-slim-buster as development

ENV \
    # poetry
    # https://python-poetry.org/docs/configuration/#using-environment-variables
    POETRY_VERSION=1.3.2 \
    POETRY_NO_INTERACTION=1 \
    POETRY_HOME="/opt/poetry" \
    \
    # Here goes our code. Added to make it importable
    PYTHONPATH="/app"

# Add poetry to path to use the "poetry" command
ENV PATH="$POETRY_HOME/bin:$PATH"

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    curl \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

# install poetry - respects $POETRY_VERSION & $POETRY_HOME
RUN curl -sSL https://install.python-poetry.org | python -

RUN poetry config virtualenvs.create false

# For development and package build
WORKDIR /build
COPY /src/ ./
RUN cd ./epic_project1_main && poetry install

# Extract dependencies and build package for production
# RUN poetry export -f requirements.txt --output requirements.txt
# COPY src src
# RUN poetry build
# # Run Poetry again to install the actual package and add "manage" as a script
# # (See tools.poetry.scripts in pyproject.toml)
# RUN poetry install

WORKDIR /src

EXPOSE 8000

CMD ["manage", "start-reload"]

# The production stage installs requirements and the app whl
FROM python:3.10-slim-buster as production

ENV PYTHONUNBUFFERED=1 \
    # prevents python creating .pyc files
    PYTHONDONTWRITEBYTECODE=1 \
    \
    # pip
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on

# Dependencies installed in a separate step to speed up builds
COPY --from=development /build/requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /wheels
COPY --from=development /build/dist/*.whl .
RUN pip install $(ls)

#COPY ./alembic /alembic
WORKDIR /

EXPOSE 8000
CMD ["manage", "start"]