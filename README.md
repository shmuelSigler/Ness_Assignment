# Overview!

Simple app to show full CI/CD pipeline using .NET 8, Docker, GitHub Actions and some DevOps best practices.  
Goal is to show the full workflow from code to Docker Hub.

---

##  Key Features

- Minimal .NET 8 “Hello World” console app using Unit tests
- Multi-stage Docker build for small final image
- GitHub Actions pipeline with full CI/CD
- Semantic versioning based on Git tags
- Image pushed to [Docker Hub](https://hub.docker.com/r/sigler05/hello-world) with secrets
- Container run and output verification in CI
- Image security scan using [Trivy](https://github.com/aquasecurity/trivy-action)


##  CI/CD Pipeline

Every time you push to `main`, the pipeline does:

1. Restore dependencies
2. Build the app
3. Run unit tests (80%+ coverage)
4. Publish the app
5. Derive semantic version from git tags
6. Build and tag Docker image 
7. Scan image for CVEs using Trivy
8. Push image to Docker Hub using GitHub secrets
9. Run the image and check it prints `Hello World`
10. Propagate  metadata between jobs and print git version tag

👉 [See latest successful workflow run](https://github.com/shmuelSigler/Ness_Assignment/actions/workflows/ci-cd.yml)

![CI/CD Status](https://github.com/shmuelSigler/Ness_Assignment/actions/workflows/ci-cd.yml/badge.svg)

---

## Run Locally
Clone project
```bash
git clone https://github.com/shmuelSigler/Ness_Assignment.git
cd Ness_Assignment
```

You can run the GitHub Actions workflow locally using [act](https://github.com/nektos/act).
You can easily install a pre-built act executable on any system with bash via below commandline

### Install `act`

```bash
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
sudo mv ~/bin/act /usr/local/bin/
act --version
```


You will need 3 secrets to run the pipeline:

GITHUB_TOKEN – any string is fine if you just test

DOCKERHUB_USER – your Docker Hub username

DOCKERHUB_TOKEN – create token from Docker Hub account settings

```bash
act -s GITHUB_TOKEN=your_token -s DOCKERHUB_USER=your_username -s DOCKERHUB_TOKEN=your_token
```

## Documentation

[Automating Semantic Versioning with GitHub Actions
](https://medium.com/@swastikaaryal/automating-semantic-versioning-with-github-actions-33e9fa23d912)

[install a pre-built act executable  ](https://nektosact.com/installation/index.html)

[Setting up Trivy in your GitHub Actions](https://thomasthornton.cloud/2025/03/18/setting-up-trivy-in-your-github-actions/)

[Getting Started with .NET Core Unit Testing](https://medium.com/@agrawalvishesh9271/mastering-unit-testing-in-net-core-2-1b0f48075b61)
