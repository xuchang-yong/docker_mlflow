[![Website][website-shield]][website-link]
[![LinkedIn][linkedin-shield]][linkedin-url]


That code describes 3-container infrastructure to run MLFLow + Conda

## System Architecture

1. MLFlow Server: A centralised hub for model repo, this server ensures that  ML models are stored, versioned, and easily accessible for other components [named: mlflow_server]
2. API: Powered by FastAPI, this component is key for model serving. It allows manual reloading, fetches fresh training data from the database, and stands as a bridge between our frontend and backend operations [named: api]
3. Training Container: As the name suggests, this container is responsible for training the ML model. Once the training step is completed, the model is uploaded to the MLFlow server [named: mlops]

### FastAPI code
The code under ./src/api is described in separate README.md under project  https://github.com/MidnightSkyUniverse/minimmedia


## Setting Things UP

Ensure you have docker and docker-compose installed
The Docker server needs to be up and running before initialising the containers


### Conda configs


For virtual environment setups within containers, configurations are found in _./docker/conda-cfg_
Every container utilizes its unique config file. Separate _environment-<NAME>.yml_ files form the corresponding _conda-lock-<NAME>.yml_ files. The run_all.sh script creates these lock files. Lock files are being copied by Docker during container initialisation
Unless your environment alters, these configurations remain maintenance-free

### Installation of Docker Containers
* The ./docker/ directory holds essential Dockerfiles and a docker-compose.yml for container orchestration
* Preparing the Environment: After pulling the code from the repository, navigate to the ./docker directory. This is where the magic begins
* Deploying the MLflow Server & API Containers: From the ./docker directory, use the command docker compose up –build to build the primary containers. Once the containers are up and active, you can connect to the MLflow server at http://<IP>:5001 and the API at http://<IP>:5002. A successful connection to the MLflow UI or a message stating “Welcome to the API service!” from the API server confirms their operational status.
* Launching the MLOps Container: This container is at the heart of model training. Running the command docker compose up mlops –build from the ./docker directory will kickstart the process. The code does not contain any files to initiate the process as I kept the code simple to show the Docker + MLFlow + Conda solution

```
# From within ./docker directory
docker compose up --build
docker compose up mlops --build
```

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/alibinkowska
[website-shield]: https://img.shields.io/badge/Website%20-%20Ali%20Binkowska%20-%2000CCFF?style=for-the-badge&color=00CCFF&link=https%3A%2F%2Falibinkowska.co
[website-link]: https://alibinkowska.co
