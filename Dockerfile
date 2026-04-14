# To use an official python runtime as a parent image
FROM python:3.9-slim

# To set the working directory in the container
WORKDIR /app

# To install system dependencies required for mysql client
RUN apt-get update && apt-get install -y gcc default-libmysqlclient-dev pkg-config && \
    rm -rf /var/lib/apt/lists/*

# To copy the requirements file to leverage Docker cache
COPY requirements.txt .

# To install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# To copy the rest of the application code
COPY . .

# To expose the port the app runs on
EXPOSE 5000

# To run the application
CMD ["python", "app.py"]