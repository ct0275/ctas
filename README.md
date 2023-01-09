# ctas
Create tibero tables as select from heterogeneous databases

## What does it?
I don't want to make something that already exists, remaking what already exists is stupid like create tables with coding ddl, even from another world.

This ctas script make all tibero tables came from another worlds, using awsome private schema option.

## Prerequisites
ctas is a tiny batch file on windows, so it needs some install before use.

### 1. Java development tookit
> <span style='color: #9061ff'> JDK 1.8 </spqn>
>
> Java SE Development Kit 8u202
>
> https://www.oracle.com/kr/java/technologies/javase/javase8-archive-downloads.html
>
### 2. Tibero database & java gateway
>
> <span style='color: #9061ff'> Timaxsoft tibero java gateway </spqn>
>
> tbjavagw 6.0
>
> https://technet.tmaxsoft.com/ko/front/download/viewDownload.do?cmProductCode=0301&version_seq=PVER-20150504-000001&doc_type_cd=DN

```bash
# ctas.cmd 

C:\Users\imuser\migration>ctas.cmd -d rbyouth
table abcd drop.
...
C:\Users\imuser\migration>ctas.cmd -c rbyouth
table abcd created.
...
```
## Usage
And use like this
```bash
ctas.cmd -d [schema name] => drop all tables in specified schema
ctas.cmd -c [schema name] => create all tables in specified schema
ex> ctas.cmd -d rbyouth
    ctas.cmd -c rbyouth
