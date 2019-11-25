FROM rasa/rasa:1.4.6-full

COPY setup.py .
COPY requirements.txt .
COPY data /data
COPY nlu_hyperopt /nlu_hyperopt
COPY scripts /scripts

# Make sure we use the virtualenv
ENV PATH="/build/bin:$PATH"

# Be root
USER root

RUN pip install -U pip && pip install -r requirements.txt && chmod -R +x /scripts

WORKDIR "/"

ENTRYPOINT ["/build/bin/python"]

CMD ["-m", "nlu_hyperopt.app"]