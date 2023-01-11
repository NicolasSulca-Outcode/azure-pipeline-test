FROM python:3

ENV PYTHONUNBUFFERED  1
RUN mkdir /pipelines
WORKDIR /pipelines

COPY . /pipelines/
COPY requirements.txt /pipelines/requirements.txt
RUN pip install -r /pipelines/requirements.txt
RUN apt-get update && apt-get install -y binutils libproj-dev gdal-bin
ENV GDAL_LIBRARY_PATH /usr/local/lib/libgdal.so
CMD ["gdalinfo", "--version"]


