@ECHO OFF
setlocal EnableDelayedExpansion

Title Configurando o ambiente Docker

set /p AWS1="Deseja configurar o ambiente do docker em sua estacao? (S/N) "

IF "!AWS1!" == "S" (   
  GOTO :DO
)
IF "!AWS1!" == "s" (   
  GOTO :DO
)
IF "!AWS1!" == "N" (   
  GOTO :NOTDO
)
IF "!AWS1!" == "n" (   
  GOTO :NOTDO
)

:DO

  SET DIRDOCK=D:\docker
  SET DIRDOCKUS=!DIRDOCK!\!username!

  IF EXIST "!DIRDOCK!" (

    set /p AWSD="O diretorio !DEL1! ja existe e sera apagado, deseja continuar? (S/N) "

    IF "!AWSD!" == "N" (   
      GOTO :NOTDO
    )
    IF "!AWSD!" == "n" (   
      GOTO :NOTDO
    )

    echo "Deletando o diretorio !DIRDOCK!"
    rd /s /q "!DIRDOCK!"

  )

  echo "Criando os diretorios padroes de projeto !DIRDOCK!"
  mkdir "!DIRDOCK!"
  mkdir "!DIRDOCKUS!"
  mkdir "!DIRDOCKUS!\apache"
  mkdir "!DIRDOCKUS!\config"
  mkdir "!DIRDOCKUS!\data"
  mkdir "!DIRDOCKUS!\data\mysql"
  mkdir "!DIRDOCKUS!\php"
  mkdir "!DIRDOCKUS!\www"
  mkdir "!DIRDOCKUS!\db"

  echo "Copiando os arquivos padroes do Docker para !DIRDOCKUS!"
  copy /Y "docker-compose.yml" "!DIRDOCKUS!"

  echo "Copiando os arquivos padroes do Apache para !DIRDOCKUS!"
  copy /Y "apache\*.*" "!DIRDOCKUS!\apache"

  echo "Copiando os arquivos padroes do /phpmyadmin/mysql"
  copy /Y "config\*.*" "!DIRDOCKUS!\config"
  copy /Y "www\*.*" "!DIRDOCKUS!\www"

  echo "Copiando os arquivos padroes do PHP para !DIRDOCKUS!"
  copy /Y "php\*.*" "!DIRDOCKUS!\php"

  echo "Copiando o dockerfile do mysql para !DIRDOCKUS!"
  copy /Y "db\*.*" "!DIRDOCKUS!\db"

  copy /Y "dockerstart.bat" "!DIRDOCKUS!"

  echo "Inicializando o docker pela primeira vez"
  cd\
  D:
  cd "!DIRDOCKUS!"
  docker build .
  docker-compose build
  docker-compose up

  GOTO :NOTDO

:NOTDO

echo "Configuracao concluida do ambiente docker"
pause