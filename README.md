# bhima-test-e2e
Setup files for the BHIMA End-to-End test server

## Set up the E2E test server
- CLONE THIS REPOSITORY in the user account on the E2E test server
  - cd <user account>
  - git clone git@github.com:IMA-WorldHealth/bhima-test-e2e.git builds
  - cp builds/run_tests .
  - chmod +x ./run_tests

- CLONE THE BHIMA DIRECTORY
  - cd <user account>
  - clone the Bhima repo from IMA World Health
     - git clone git@github.com:IMA-WorldHealth/bhima.git Bhima

- RUN THE TESTS
  - cd <user account>
  - './run_tests'

## Note:
- Early attempts to run the tests in a Docker container were not succesful.  Those files have been moved to the 'docker' folder.
- Files and scripts for Docker containers are in the 'docker' folder.

