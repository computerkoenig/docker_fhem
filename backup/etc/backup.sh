#!/bin/bash

tar czvf - /backup | ccrypt --key '%Y' > /opt/backup_data/%Y-%m-%d_backup.tar.gz.cpt
