#!/bin/bash

lsblk -o NAME,TYPE,SIZE | awk '$2=="disk" {print}' | grep nvme
