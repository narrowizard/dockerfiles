1. clone pgcli: git@github.com:dbcli/pgcli.git
2. docker build -t narrowizard/pgcli:latest .
3. docker tag narrowizard/pgcli:latest narrowizard/pgcli:v4.1.0
4. docker push narrowizard/pgcli:latest
5. docker push narrowizard/pgcli:v4.1.0