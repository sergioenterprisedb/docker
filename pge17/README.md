# Install EDB Postgres Extended in Docker
This demo show how to install EDB Postgres Extended 17.2 in Docker

## Prerequisites
- Docker
- Access to EDB repo. It is necessary to have an EDB user first.

## Create token file
Create in this directory a file called .token with your [EDB token](https://www.enterprisedb.com/repos-downloads). Ex:
```
echo "<your_token>" > .token
```

# Build Docker image
```
./01_build.sh
```

# Create container
```
./02_run.sh
```

# Cleanup environment
```
./99_cleanup.sh
```

