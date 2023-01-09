@echo off

tbsql -s sys/tibero < _dblink_%1.sql
