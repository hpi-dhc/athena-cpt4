# Athena-CPT4

This repository provides a Docker container for adding the CPT-4 terminology to the OMOP vocabulary files downloaded from [Athena](https://athena.ohdsi.org).
The entire procedure is a containerized version of the instructions provided by the `readme.txt` file, which resides in the vocabulary folder downloaded from Athena.

**Prerequisites:**
- An up-to-date Docker installation (tested with `v20.10.14`).
- `git` installed.
- A stable internet connection.
- The OMOP vocabulary downloaded from Athena and unzipped.
- A UMLS account in order to retrieve your personal UMLS API Key (the second entry in your [UMLS Licensee Profile](https://uts.nlm.nih.gov/uts/profile)), necessary for loading the CPT-4 terminology.
- For Linux users: Please provide Docker and its corresponding user group(s) read AND write access to your file system (specifically: This folder from which you build your Docker container AND the folder containing the unzipped Athena vocabulary files).


# Instructions

**1) Clone this repository:**

Use either of the following two commands to clone this repository to your computer:

```
git clone https://github.com/hpi-dhc/athena-cpt4.git
git clone git@github.com:hpi-dhc/athena-cpt4.git
```

On your machine, `cd` to the cloned folder and create an empty folder called `output`.


**2) Build Docker image:**

Initially, you need to build the Docker image (name: athena-cpt4) from the Dockerfile provided within this repository.
Make sure that your working directory is this folder.

```
docker build -t athena-cpt4 .
```

**3) Run image as a Docker container:**

Once the image has been built, run it as a container with the following command, replacing:
- `PATH_OF_UNZIPPED_ATHENA_FOLDER` with the absolute path to the unzipped Athena folder (without any enclosing quotation marks or parentheses)
- `YOUR_UMLS_API_KEY` with your personal UMLS API Key (in the format of *12345678-90ab-cdef-ghij-klmnopqrstuv*, again without any enclosing quotation marks or parentheses)

```
docker run --rm -d --name athena-cpt4 --mount type=bind,source=PATH_OF_UNZIPPED_ATHENA_FOLDER,target=/data -e apikey=YOUR_UMLS_API_KEY athena-cpt4
```

If you wish to see the console output of the container, remove the `-d` flag from the command above.
The container will automatically be stopped and removed after the data will have been processed.

**4) Access your files:**

The `.csv` files amended by the CPT-4 terminology are now available in the same folder where the Athena had previously been unzipped to and are now ready to be used in further projects relying on OMOP data.


## Notes:

- If not otherwise specified, all commands are executed on the host machine with the working directory being the cloned repository.
- This repository is intended for local use only. Even though easily implementable best practices for creating Dockerfiles were followed, deployment in a production setting would require additional security mechanisms.
- Neither code nor any other data from CPT-4, UMLS, or Athena are provided herein. The code provided in this repository just helps you to execute your personal copy of code and data originating from these providers. Thus, please make sure that you comply with their respective licenses.
- This project intentionally refrains from using a copyleft license. Nevertheless, all users are kindly invited to contribute to the project, specifically to leave a note to the author if you find parts of the code to be broken or the explanations in this README ambiguous.


## License
Copyright 2022 Hasso Plattner Institute

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this work except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.


*(Written by [Jan Philipp Sachs](www.jpsachs.de) on May 30, 2022)*