cls
echo off
cls

REM - VARIAVEIS
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
echo #         Aquivos de origem e destino	         #
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
echo #-- Origem do arquivo -- 
set /p ORIGEM=pasta de origem :
echo #-- Destino --
echo #
echo #-- Nao esqueca de colocar o destino entre "aspas"
set /p DESTINO="Pasta de Destino:"
echo -- Set a pasta de logs--
set /p LOG=endereço do log:
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
echo #                  Config de email		         #
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
REM - EMAIL
ECHO #---EMAIL---#
set /p EMAIL=
echo #---Passwords--#
set /p PASS=
echo #--Server SMTP--#
echo #--padrao e o smtp.live.com--#
echo #
echo #--e pode ser alterado na edicao do arquivo--#
set SERVER=smtp.live.com
pause

REM - ESTRUTURA
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
echo #         COPIA DE ARQUIVOS E/OU DIRETORIOS         #
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
xcopy %ORIGEM% %DESTINO% /E /Y /C /H
REM /E - Copia diretórios e subdiretórios, inclusive os vazios.
REM /Y - Suprime o prompt para você confirmar se deseja substituir um arquivo de destino existente.
REM /C - Continua copiando, mesmo que ocorram erros.
REM /H - Copia arquivos ocultos e do sistema também.
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
echo # GERANDO LOG DE ARQUIVOS E/OU DIRETORIOS COPIADOS  #
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
dir /s %DESTINO% > %LOG%\Arquivos.txt

echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
echo #          ENVIANDO E-MAIL COM LOG EM ANEXO         #
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #

REM - fica esperto com o license que pode parar de funcionar, ai tem que procurar no SMTP MAILER

SMTPMAIL.EXE license=20200613206ce23e762aa088dcda73c4be8b9a2a ssl from=%EMAIL% to=%EMAIL% body="O backup foi realizado com sucesso!" user=%EMAIL% password=%PASS% subject=Backup server=%SERVER% attachment="C:\Users\jhowp\OneDrive\Desktop\log\Arquivos.txt"

echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
echo #                    EMAIL Enviado                  #
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #

pause
