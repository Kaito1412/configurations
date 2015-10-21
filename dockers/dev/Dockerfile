FROM fedora 
MAINTAINER kaito

RUN dnf update -y
RUN dnf install -y nodejs npm
RUN npm install -g bower gulp grunt cordova@5.0.0 ionic@1.5.0

VOLUME ["/home/kaito/Workspace/personal/pickUpKnow"]
#WORKDIR 

EXPOSE 8100

ENTRYPOINT ["/bin/bash"]
