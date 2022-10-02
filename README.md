<p align="center">
  <img height="100" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/latex/latex.png" alt="" />
  <img height="100" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/mysql/mysql.png" alt="" />
  <img height="100" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/docker/docker.png" alt="" />
</p>

**Menu**:

- [Task](#task)
- [How to run app](#how-to-run-app)
- [Application stack](#application-stack)
- [Project structure](#project-structure)

## Task

- adhitect database and write coursework

## How to run app

Start database:

```bash
make db-install
make db
```

Create report:

```bash
make tex
```

## Application stack

- [Docker, docker-compose](https://www.docker.com/get-started/)
- [make](https://stackoverflow.com/questions/32127524/how-to-install-and-use-make-in-windows#comments-32127632)
- [vs code](https://code.visualstudio.com/#alt-downloads)
- [vs code Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)
- [vs code Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [vs code Database Client](https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-database-client2)
- [vs code LaTeX](https://marketplace.visualstudio.com/items?itemName=mathematic.vscode-latex)
- [vs code pdf](https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf)

## Project structure

```bash
tree --charset ascii -a -I ".git|node_modules|docker|*.architect~|*.ods#" > README.tree.txt
```

[View project tree](README.tree.txt)
