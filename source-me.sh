#
# ironfish helpers
#


#
# ironfish alias for using ironfish cli via docker
#   with safety catch to avoid using entrypoint which starts node
#
ironfish() {

    if [[ "$#" -gt 0 && "$1" != "" ]]; then
        command="$@"
    else
        command="help"
    fi

    docker run --rm --tty --interactive --network host \
        --volume $HOME/.ironfish:/root/.ironfish \
        ghcr.io/iron-fish/ironfish:latest \
        ${command}

}



