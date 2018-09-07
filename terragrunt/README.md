# terragrunt 


## How or why to use this project

I needed a way to run terragrunt/form in a clean environment so I can lock down their versions. This also allows me to experiment with different terragrunt/form versions safely.

I have my Mac `~/` folder setup to have this folder structure:

```
.
├── .Trash
├── .aws
├── .config
├── .docker
├── .git
├── .gnupg
├── .ssh
├── .ssh-docker
├── .terraform.d
├── Applications
├── Desktop
├── Documents
├── Downloads
├── Library
├── Movies
├── Music
├── Pictures
├── Public
├── VirtualBox\ VMs
├── git
```

`.ssh-docker` contains a copy of my `.ssh` folder but with a different `config` file for MacOS vs Ubuntu.


## Technical or step-by-step instructions

Assuming this same setup, use the `docker run` example, run it from `~/`, and all the bind mounts will work. This gives you ssh, .aws config/credentials, and git repos in read-only mode. Adjust anything you need locally and then run `terragrunt plan` or `terragrunt apply` from the container.


Example:

```
docker run -it --mount type=bind,source=${PWD}/.ssh-docker,target=/root/.ssh,readonly --mount type=bind,source=${PWD}/git,target=/root/git --mount type=bind,source=${PWD}/.gitconfig,target=/root/.gitconfig,readonly --mount type=bind,source=${PWD}/.aws,target=/root/.aws,readonly --name terragrunt --hostname docker-terragrunt jknsware/docker-terragrunt:<terragrunt-version.terraform-version> /bin/bash
```

Containers are versioned based on `terragrunt-version.terraform-version`.

Example:

```
ENV TERRAFORM_VERSION 0.9.11
ENV TERRAGRUNT_VERSION v0.12.16

docker build . --tag jknsware/docker-terragrunt:0.9.11.0.12.16
```


### Tagged Verions

|Tagged Version|Terraform Version|Terragrunt Version|
|--------------|------------------|-----------------|
|0.9.11.0.12.16|0.9.11|0.12.16|
|0.11.1.0.13.23|0.11.1|0.13.23|

### External Links

- [Google](https://www.google.com), to find more stuff.


### Thanks

- [@codep0tato](https://github.com/codep0tato), for introducing me to <insert_anything_cool_here>. 
