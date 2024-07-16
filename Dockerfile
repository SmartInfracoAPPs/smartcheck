FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

# Upgrade pip
RUN pip install --no-cache-dir --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

COPY ./app .

CMD ["python", "app.py"]
