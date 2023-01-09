@echo off

echo %1 %2

rem ctas.cmd -d|-c counsel
rem ctas.cmd    -c counsel_b1
rem ctas.cmd    -c counsel_b2
rem ctas.cmd    -c counsel_b3
rem ctas.cmd -d|-c kdream
rem ctas.cmd    -c kdream_b1
rem ctas.cmd    -c kdream_b2
rem ctas.cmd -d|-c ps01dba
rem ctas.cmd -d|-c care
rem ctas.cmd -d|-c dream
rem ctas.cmd -d|-c simter
rem ctas.cmd -d|-c u_counsel
rem ctas.cmd -d|-c u_sim
rem ctas.cmd -d|-c u_jikimi
rem ctas.cmd -d|-c u_counsel2
rem ctas.cmd -d|-c u_sim01
rem ctas.cmd -d|-c u_sim02
rem ctas.cmd -d|-c newweb
rem ctas.cmd -d|-c chatting
rem ctas.cmd -d|-c hrddb
rem ctas.cmd -d|-c rbyouth

if "%1" == "-c" (
  echo set time on > create_%2.sql
  type .\gncrt\_excpt_%2.sql >> create_%2.sql 2>nul
  tbsql -s sys/tibero < .\gncrt\_gncrt_%2.sql >> create_%2.sql
  tbsql sys/tibero < create_%2.sql > create_%2.log
)
If "%1" == "-d" (
  echo set time on > drop_%2.sql
  tbsql -s sys/tibero < .\gndrp\_gndrp_%2.sql >> drop_%2.sql
  tbsql sys/tibero < drop_%2.sql > drop_%2.log
)

echo "Completed"