# application

## Files
| File name | Description |
| ----------- | ----------- |
| app | code to return a list of all running EC2 instances in a region in an AWS account along with their corresponding IPs and Tags when called on the **/ec2** path |
| .dockerignore | list of files to exclude while building the docker image |
| Dockerfile | instructions to build the docker image for our application |
| requirements.txt | list of items to be installed by pip |

## Dependencies
- [python](https://www.python.org/downloads/)
- [pip](https://pip.pypa.io/en/stable/installation/)
- Flask, gunicorn and boto3
  ```
  pip install --no-cache-dir -r requirements.txt
  ```
- [Docker](https://docs.docker.com/engine/install/)

## Steps
1. Move to `app` directory and run the application
    ```
    cd app
    python3 instance_details.py
    ```
    Output
    ```
     * Serving Flask app 'instance_details' (lazy loading)
     * Environment: production
       WARNING: This is a development server. Do not use it in a production deployment.
       Use a production WSGI server instead.
     * Debug mode: on
     * Running on all addresses.
       WARNING: This is a development server. Do not use it in a production deployment.
     * Running on http://192.168.94.80:8000/ (Press CTRL+C to quit)
     * Restarting with stat
     * Debugger is active!
     * Debugger PIN: 185-776-574                         
    ```
    
    Hence our application is running and can check for the output by accessing the url with `/ec2` path
    - Browser
       ```
       http://<ip>:8000/ec2
       ```
    - Terminal
       ```
       curl http://<ip>:8000/ec2
       ```
2. Build and push image to Docker Hub
   - Go a directory back and build the image
     ```
     cd ..
     docker build -t instance_details .
     ```
   - Login to docker by inserting credentials
     ```
     docker login
     ```
   - Tag the image
      ```
     docker tag instance_details:latest <username>/instance_details:latest
     ```
   - Publish the image
      ```
     docker push <username>/instance_details:latest
     ```
   
