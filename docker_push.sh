#!/bin/bash

sudo docker login

sudo docker push fullaxx/dps64
sudo docker push fullaxx/vps64
sudo docker push fullaxx/rapidbuild64
sudo docker push fullaxx/rapidworkstation64
sudo docker push fullaxx/rapidfileserver64

# sudo docker push fullaxx/intellaptop64
