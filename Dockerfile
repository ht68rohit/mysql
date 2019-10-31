FROM python:3.7-alpine

RUN mkdir /app
COPY requirements.txt /app

RUN apk --no-cache add --virtual python3-dev
RUN apk --no-cache add --virtual libmysqlclient-dev

RUN apk --no-cache add --virtual build-dependencies \
        build-base \
        py-mysqldb \
        gcc \
        libc-dev \
        libffi-dev \
        mariadb-dev \
        && pip install -qq -r /app/requirements.txt

COPY app.py /app

ENTRYPOINT ["python","-u","/app/app.py"]
