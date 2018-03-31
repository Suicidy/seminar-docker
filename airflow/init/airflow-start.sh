#!/bin/bash

su airflow

airflow initdb
airflow webserver