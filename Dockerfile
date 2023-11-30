# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app

# Clone the Searx repository
RUN apt-get update && \
    apt-get install -y git && \
    git clone https://github.com/searx/searx.git .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app runs on
EXPOSE 8888

# Specify the command to run on container start
CMD ["python", "searx/webapp.py"]
