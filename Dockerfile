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

# Specify Flask version
RUN pip install --no-cache-dir Flask==2.0.0

# Expose the port the app runs on
EXPOSE 5000

# Set the environment variable for Searx to use the correct base URL
ENV BASE_URL=https://openvpn-h2f2.onrender.com

# Specify the command to run on container start
CMD ["python", "searx/webapp.py"]
