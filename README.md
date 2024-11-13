# vaultwarden_restic

Add restic backup for vaultwarden in docker

# Usage

```bash
# initialize repository
restic init
# build docker image
docker build -t vw_restic -f Dockerfile
# start the container
docker run -v ./data:/data -p 80:80 -e RESTIC_REPOSITORY={repo there} -e RESTIC_PASSWORD={password here} --name vaultwarden_restic vw_restic
```

## some useful environment variables

```bash
# just for example
RESTIC_REPOSITORY="your repository"
RESTIC_PASSWORD="your password"

# for s3 storage
AWS_DEFAULT_REGION="region"
AWS_ACCESS_KEY_ID="your key id"
AWS_SECRET_ACCESS_KEY="your access key"
```
