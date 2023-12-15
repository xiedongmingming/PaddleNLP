# Copyright (c) 2022 PaddlePaddle Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

model_item=CE_gpt-345m_seqlen1024_pretrain
dp_degree=1
mp_degree=1
pp_degree=1
sharding_degree=8
sharding=stage2
bs_item=32
fp_item=bf16
run_mode=SD8-stage2-mbs2-acc2
device_num=N1C8
max_iter=50000

model=gpt
micro_bs=2

bash ./test_tipc/dygraph/hybrid_parallelism/gpt_stage2_ce/benchmark_common/prepare.sh
# run
bash ./test_tipc/dygraph/hybrid_parallelism/gpt_stage2_ce/benchmark_common/run_benchmark.sh ${model_item} ${fp_item} ${dp_degree} ${mp_degree} ${pp_degree} ${micro_bs} ${bs_item} ${run_mode} ${device_num} \
${max_iter} ${sharding} ${sharding_degree} 2>&1;