# We will get pre-built image of OS and Python

# Use a pre-built image of OS and Python
FROM python:3.10.0-slim-buster

# Set the working directory inside the container
WORKDIR /app

# Upgrade pip inside the container
RUN python -m pip install --upgrade pip

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose port 5000 for the Flask app
EXPOSE 5000

# Set environment variables for Flask
ENV FLASK_APP=loan_app

# Command to run the Flask app
CMD ["flask", "run", "--host=0.0.0.0"]

