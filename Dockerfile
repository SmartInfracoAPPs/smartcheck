# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy requirements file first for better caching
COPY requirements.txt .

# Upgrade pip and setuptools
RUN pip install --no-cache-dir --upgrade pip setuptools

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Define a build argument for the app path
ARG APP_PATH

# Copy the entire application directory from host to the container
COPY $APP_PATH /app

# Command to run your application
CMD ["python", "app.py"]
