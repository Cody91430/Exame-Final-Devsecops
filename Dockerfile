FROM python:3.11-alpine

WORKDIR /app

RUN apk add --no-cache ca-certificates

RUN addgroup -S exam-user && adduser -S exam-user -G exam-user

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=exam-user:exam-user . .

USER exam-user

EXPOSE 5000

CMD ["python", "app.py"]
