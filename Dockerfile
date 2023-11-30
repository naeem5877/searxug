# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory to /app
WORKDIR /app

# Clone the searx repository into the container
RUN git clone https://github.com/searx/searx.git .

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose the port the app runs on
EXPOSE 8888

# Define environment variable
ENV SEARX_SETTINGS_PATH /app/searx/settings.yml

# Run searx when the container launches
CMD ["python", "searx/webapp.py"]
