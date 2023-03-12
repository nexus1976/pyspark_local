FROM apache/spark-py:v3.3.2
COPY smaller.csv.gz .
ENV SPARK_HOME="/opt/spark"
ENV PATH="${SPARK_HOME}/bin/:${PATH}"
ENV PYTHONPATH="${SPARK_HOME}/python/:$PYTHONPATH"
ENV PYTHONPATH="${SPARK_HOME}/python/lib/py4j-0.10.9.5-src.zip:$PYTHONPATH"
RUN alias python=python3
USER $NB_UID
# ENTRYPOINT ["/opt/spark/bin/pyspark"]
ENTRYPOINT ["tail", "-f", "/dev/null"]