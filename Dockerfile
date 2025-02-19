FROM pretix/standalone:stable
USER root
RUN python3 -m pip install --upgrade pip
RUN pip3 install --upgrade wheel
RUN pip3 install --upgrade setuptools
USER pretixuser
RUN cd /pretix/src && make production
