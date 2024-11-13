1. clone mycli: git@github.com:dbcli/mycli.git
2. check out the latest version tag
3. cp Dockerfile
4. docker build -t narrowizard/mycli:latest .
5. docker tag narrowizard/mycli:latest narrowizard/mycli:v1.28.0
6. docker push narrowizard/mycli:latest
7. docker push narrowizard/mycli:v1.28.0