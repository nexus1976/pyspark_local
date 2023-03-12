# pyspark_local
## This repo is a simple setup using Docker Compose that will spin up a single node Spark cluster locally.
### To get started, do the following steps.
- Ensure you have Docker and Docker Compose properly installed and clone this repo to a local folder.
- In your terminal, go to your local folder of this repo and execute the following command: `docker compose up -d`
- Attach a shell to the container once it is up and running.
- This repo will have copied working csv data file with test data in it. They are dispatch records of NYC taxi cab activity. The file should be visible in the working folder that you default to when you attach a shell (which should be `/opt/spark/work-dir`).
- After ensuring that you are in the proper working folder in the attached container, execute the following command to start a Spark session: `pyspark`
- So long as you have a Spark session running, you can see statistics by navigating a browser to `http://localhost:4040`

The following are some things you can enter into the PySpark shell that have been interesting to play with:
```
df = spark.read.option("header", "true").csv('smaller.csv.gz')
df.write.saveAsTable("smallerTable")
df.columns
spark.sql("SELECT * FROM smallerTable WHERE dispatching_base_num='B03177'").show()
spark.sql("SELECT * FROM smallerTable WHERE dispatching_base_num='B03177'").collect()
exit()
```