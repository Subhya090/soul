# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Install dependencies for building C++ programs
RUN apt-get update && apt-get install -y g++ && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Compile the C++ file
RUN g++ -o soul soul.cpp

# Make the compiled binary executable
RUN chmod +x soul

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run the Python script by default
CMD ["python", "soul.py"]
