
######################################################################
#<
#
# Function: p6df::modules::p6emacs::deps()
#
#>
######################################################################
p6df::modules::p6emacs::deps() {
    ModuleDeps=(
      p6m7g8/p6common
      john2x/jenkinsfile-mode
	  Silex/docker.el
    )
}

######################################################################
#<
#
# Function: p6df::modules::p6emacs::home::symlink()
#
#>
######################################################################
p6df::modules::p6emacs::home::symlink() {

    echo ln -fs $P6_DFZ_SRC_DIR/Silex/docker.el $P6_DFZ_SRC_P6M7G8_DIR/p6emacs/elpa/docker-20190730.711
#    ln -fs $P6_DFZ_SRC_DIR/Silex/docker.el $P6_DFZ_SRC_P6M7G8_DIR/p6emacs/elpa/docker-20190730.711
}
