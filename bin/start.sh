conda activate tfew
export NICL_ROOT=`pwd`
export PYTHONPATH=$NICL_ROOT:$PYTHONPATH
export OUTPUT_PATH=$NICL_ROOT/exp_out
export CONFIG_PATH=$NICL_ROOT/configs
export HF_HOME=/home/ouyixin/.cache/huggingface
export CUDA_VISIBLE_DEVICES=0