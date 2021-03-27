FROM python:3.8-alpine3.13
WORKDIR /app
ADD /tmp/requirements.txt /app/requirements.txt
RUN apk add --update --no-cache alpine-sdk py-pip mariadb-connector-c-dev && \
    pip install -r requirements.txt
COPY . /app
RUN chmod +x gunicorn.sh
EXPOSE 3000
ENTRYPOINT ["sh","/app/gunicorn.sh"]
