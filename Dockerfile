FROM python:3.9-slim

WORKDIR /app/app


COPY . /app/app


RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5050

CMD ["python", "app.py"]
