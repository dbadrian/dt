FROM python:3.11-slim
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
RUN apt-get update && apt-get install -y gettext libgettextpo-dev
RUN mkdir /code
WORKDIR /code
RUN pip install --upgrade pip>=24.0 \
    && pip install poetry \
    && pip install virtualenv \
    && poetry config installer.max-workers 10 \
    && poetry config virtualenvs.create false \
    && echo "echo 'hello world'" > /test.sh && chmod +x /test.sh && echo $(pwd) && ls

ENTRYPOINT ["/bin/bash", "/test.sh"]