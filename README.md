# bhima-test-e2e
Setup files for the BHIMA End-to-End test server

## Set up the E2E test server
- clone this repository in the user account on the E2E test server
  - cd <user account>
  - git clone git@github.com:IMA-WorldHealth/bhima-test-e2e.git builds

- Clone the Bhima directory
  - cd <user account>
  - cd builds
  - clone the Bhima repo from IMA World Health into the 'builds' directory
     - git clone git@github.com:IMA-WorldHealth/bhima.git Bhima
  
- Build the image:
  - cd <user account>/builds
  - ./build_image
  
