FROM python:3.11
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
RUN apt-get update && apt-get install -y gettext libgettextpo-dev
RUN mkdir /code
WORKDIR /code
RUN pip install --upgrade pip>=24.0
RUN pip install poetry
RUN pip install virtualenv
# RUN poetry self update
RUN poetry config installer.max-workers 10
RUN poetry config virtualenvs.create false

RUN echo "echo 'hello world'" > /test.sh && chmod +x /test.sh && echo $(pwd) && ls

ENTRYPOINT ["/bin/bash", "/test.sh"]