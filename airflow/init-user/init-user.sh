#!/bin/bash

add_user()
{
    useradd -m $1
    echo "$1:$2" | chpasswd
}


add_user 'airflow'  'Ew+2n5KQrt9-aLq8'
mkdir -p /home/dags
mkdir -p /home/airflow/airflow/logs
chmod 711 /home/airflow
chmod 777 /home/dags

add_user 'user1' '$FjMC$5$upGga2&S'
add_user 'user2' 'eSBPL#@_VcTrH37n'
add_user 'user3' '!*Hw9$D_UCcLjB5&'
add_user 'user4' 'Cfn7=zLw#2cSUc^t'
add_user 'user5' '*FQ$37C&T7m_CftA'
add_user 'user6' 'CkBNQ&n!Ca8^AAY-' 
add_user 'user7' '^3C%-3_$Qcx_9Sgr'
add_user 'user8' 'Bx7WbNkS!Gv#+H4N'
add_user 'user9' '9!cT7FGkT5s&VuaJ'
add_user 'user10' 'CkBNQ&n!Ca8^AAY-'

