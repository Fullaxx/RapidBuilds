#!/bin/bash

# https://blog.nelhage.com/post/transparent-hugepages/
# https://www.kernel.org/doc/html/latest/admin-guide/mm/transhuge.html

cat /sys/kernel/mm/transparent_hugepage/enabled
