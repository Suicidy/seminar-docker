#!/bin/bash

export SPARK_HOME='/home/guest/spark-2.2.1-bin-hadoop2.7'
export PATH=$SPARK_HOME:$PATH
export PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH

jupyter notebook