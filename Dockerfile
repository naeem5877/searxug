# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory to /app
WORKDIR /app

# Clone the Searx repository
RUN git clone https://github.com/searx/searx.git .

# Install dependencies
RUN pip install -r requirements.txt

# Expose the port the app runs on
EXPOSE 8888

# Specify the command to run on container start
CMD ["python", "searx/webapp.py"]
