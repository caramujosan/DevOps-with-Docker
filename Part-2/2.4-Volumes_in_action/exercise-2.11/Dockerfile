FROM python:3.9.21-alpine3.21

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["watchmedo", "shell-command", "--patterns=*.py;requirements.txt", "--command=python3 ./my-first-devenv-app.py"]




