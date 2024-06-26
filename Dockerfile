#FROM --platform=linux/amd64 python:3.10.11-alpine3.17 as build
FROM python:3.11.2-alpine

LABEL AUTHOR=ZBUDDY

COPY /requirements.txt /requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install -r /requirements.txt
RUN apk update
RUN apk upgrade

WORKDIR /app
COPY . .

#Token variable
ENV port="PORT"

EXPOSE 2500

#Run the main program
CMD [ "python3", "-u", "api.py" ]

#Compile on mac
#sudo docker build . -t zbuddy19/autohetzner:
#docker push zbuddy19/autohetzner:tagname
