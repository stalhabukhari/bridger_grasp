#!/bin/bash
apptainer build -B $(dirname $(pwd)):/code-dir bridger.sif ApptainerFile
