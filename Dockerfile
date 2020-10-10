FROM centos
MAINTAINER Danny Lai <XDanny322@gmail.com>

# Install OS Packages
RUN yum install -y python3

# Install python requirements
COPY conf/requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

# Copy the App
COPY src/ /var/tmp/src

ENTRYPOINT ["python3", "/var/tmp/src/app/main.py"]
