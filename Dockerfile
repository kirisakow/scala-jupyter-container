FROM jupyter/all-spark-notebook

USER jovyan
WORKDIR /home/jovyan

RUN curl -sS -Lo coursier https://git.io/coursier-cli \
    && chmod +x ./coursier

ENV ALMOND_VERSION 0.13.14
ENV ALMOND_SCALA_VERSION 2.13.10

RUN ./coursier bootstrap --standalone almond:$ALMOND_VERSION --scala $ALMOND_SCALA_VERSION -o almond \
    && ./almond --install --jupyter-path /opt/conda/share/jupyter/kernels \
    && rm ./coursier ./almond
