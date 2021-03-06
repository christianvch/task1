FROM python:3.7
RUN pip3 install fastapi uvicorn
EXPOSE 80
COPY ./app /app
CMD ["uvicorn", "app.server:app", "--host", "0.0.0.0", "--port", "80"]
