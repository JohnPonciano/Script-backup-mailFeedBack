cls
echo off
cls

REM - VARIAVEIS
set ORIGEM=C:\Users\jhowp\OneDrive\Desktop\Escola
set DESTINO="C:\Users\jhowp\OneDrive\Desktop\Escola2"
set LOG=C:\Users\jhowp\OneDrive\Desktop\log

REM - EMAIL
ECHO #---EMAIL---#
set /p EMAIL=
echo #---Passwords--#
set /p PASS=
echo #--Serve SMTP--#
echo #--padrao e o smtp.live.com--#
echo
echo #--e pode ser alterado na edicao do arquivo--#
set /p SERVE=smtp.live.com

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

SMTPMAIL.EXE license=20200613206ce23e762aa088dcda73c4be8b9a2a ssl from=%EMAIL% to=%EMAIL% body="O backup foi realizado com sucesso!" user=%EMAIL% password=%PASS% subject=Backup server=%SERVE% attachment="C:\Users\jhowp\OneDrive\Desktop\log\Arquivos.txt"

echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
echo #                    EMAIL Enviado                  #
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #