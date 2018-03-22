#!/bin/bash

/etc/init.d/postgresql start

su airflow

airflow initdb
airflow webserver
