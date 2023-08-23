: source me

export DL_DIR="/nfs/shared/downloads"
export SSTATE_DIR="/nfs/shared/sstate-cache"
export SSTATE_MIRRORS=""

repo_dir=$(pwd)
target_machine="aaeon-boxer-6313"
target_image="lmp-gateway-image"

MACHINE=aaeon-boxer-6313 source setup-environment build

# Check and add if not present
[[ " $BB_ENV_EXTRAWHITE " != *" BB_NUMBER_THREADS "* ]] && export BB_ENV_EXTRAWHITE="${BB_ENV_EXTRAWHITE} BB_NUMBER_THREADS"
[[ " $BB_ENV_EXTRAWHITE " != *" PARALLEL_MAKE "* ]] && export BB_ENV_EXTRAWHITE="${BB_ENV_EXTRAWHITE} PARALLEL_MAKE"
[[ " $BB_ENV_EXTRAWHITE " != *" DL_DIR "* ]] && export BB_ENV_EXTRAWHITE="${BB_ENV_EXTRAWHITE} DL_DIR"
[[ " $BB_ENV_EXTRAWHITE " != *" SSTATE_DIR "* ]] && export BB_ENV_EXTRAWHITE="${BB_ENV_EXTRAWHITE} SSTATE_DIR"
[[ " $BB_ENV_EXTRAWHITE " != *" SSTATE_MIRRORS "* ]] && export BB_ENV_EXTRAWHITE="${BB_ENV_EXTRAWHITE} SSTATE_MIRRORS"

# [[ " $BB_ENV_PASSTHROUGH_ADDITIONS " != *" BB_NUMBER_THREADS "* ]] && export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS} BB_NUMBER_THREADS"
# [[ " $BB_ENV_PASSTHROUGH_ADDITIONS " != *" PARALLEL_MAKE "* ]] && export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS} PARALLEL_MAKE"
# [[ " $BB_ENV_PASSTHROUGH_ADDITIONS " != *" DL_DIR "* ]] && export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS} DL_DIR"
# [[ " $BB_ENV_PASSTHROUGH_ADDITIONS " != *" SSTATE_DIR "* ]] && export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS} SSTATE_DIR"
# [[ " $BB_ENV_PASSTHROUGH_ADDITIONS " != *" SSTATE_MIRRORS "* ]] && export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS} SSTATE_MIRRORS"

bitbake ${target_image} --runall=fetch
bitbake rust-native
bitbake clang-native
bitbake ${target_image}

cd $repo_dir
