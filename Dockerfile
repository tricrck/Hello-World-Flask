# Use the official Python image as the base image
FROM python:3

# Set the working directory
WORKDIR /usr/src/app

# Copy the application code
COPY app .

# Install virtualenv and create a virtual environment
RUN pip install virtualenv && \
    virtualenv venv && \
    . venv/bin/activate && \
    pip install flask

# Expose the port that the application will listen on
EXPOSE 81

# Set the virtual environment as the active environment
ENV VIRTUAL_ENV=/usr/src/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Run the application
CMD ["python", "app.py"]
