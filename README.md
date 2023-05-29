# Install and run Scala in a Jupyter Notebook as a Docker Container

Run Scala in a Jupyter Notebook as a Docker container based on [`jupyter/all-spark-notebook`][2] Docker image and [`almond`][3] kernel.

### 0. Prerequisites

* Computer with at least 8GB RAM
* Modern Web browser like the latest Mozilla Firefox or Google Chrome
* [Docker engine][1] installed

### 1. Install

1. Download the Dockerfile from above
2. `cd` to the directory where the Dockerfile has been saved
3. Build the image (this will take a few minutes as the base image weighs 5.34GB, and the Scala dependencies add in another 300MB):
```bash
docker build --tag jupyter-scala-almond . # don't miss the final dot
```

### 2. Launch

4. Create and start a container: 
```bash
docker run -dit -p 4040:4040/tcp -p 8888:8888/tcp --name any-name-you-want-for-your-container jupyter-scala-almond
```
5. View container's logs, find the URL, open it in your browser.
6. You can now run Scala 
    * either as a Jupyter Notebook (you may want to run `println(scala.util.Properties.versionString)` to print Scala version);
    * or in console (versions of Java, Scala, Almond and whatnot will be printed automatically at the beginning).

Happy coding!

[1]: https://docs.docker.com/engine/install/
[2]: https://hub.docker.com/r/jupyter/all-spark-notebook
[3]: https://almond.sh/docs/install-other
