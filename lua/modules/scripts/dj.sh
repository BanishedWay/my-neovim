#!/bin/bash

home=${HOME}
folder="/.local/share/nvim/lsp_servers/jdtls"
jdtls_folder=$home$folder
if [ ! -d "$jdtls_folder" ]; then
    cd ~/.local/share/nvim/lsp_servers/ && wget https://download.eclipse.org/jdtls/milestones/1.9.0/jdt-language-server-1.9.0-202203031534.tar.gz -O jdtls.tar.gz && rm -rf jdtls && mkdir jdtls && tar zxvf jdtls.tar.gz -C ./jdtls && rm *.tar.gz
fi
