p6df::modules::p6emacs::version() { echo "0.0.1"; }

p6df::modules::p6emacs::init() {

  p6_emacss_init "$P6_DFZ_SRC_DIR/p6m7g8/p6emacs"
}

p6_aws_init() {
  local dir="$1"

  p6df::util::path_if "$dir/bin"
}
