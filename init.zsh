p6df::modules::p6emacs::version() { echo "0.0.1" }
p6df::modules::p6emacs::deps()    {
    ModuleDeps=(
	john2x/jenkinsfile-mode
	Silex/docker.el
    )
}

p6df::modules::p6emacs::home::symlink() {

    ln -fs $P6_DFZ_SRC_DIR/Silex/docker.el $P6_DFZ_SRC_P6M7G8_DIR/p6emacs/elpa/docker-20190730.711


}
