FROM python:3.11-slim

# Create non-root user
RUN groupadd -r appuser && useradd -r -g appuser appuser

#copy code
COPY code/ /app/code/
WORKDIR /app/code

#Install deps
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN chown -R appuser:appuser /app
USER appuser

EXPOSE 80

# Start server
ENTRYPOINT [ "./entrypoint.sh" ] 
