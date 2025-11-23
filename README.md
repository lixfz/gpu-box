# 关于gpu-box

为减少对GPU服务器性能及稳定性评估工具镜像数量，`gpu-box`将常用工具整合为单一镜像，目前包括以下工具：
* nccl-tests: https://github.com/NVIDIA/nccl-tests
* gpu-burn: https://github.com/wilicc/gpu-burn

# 构建镜像

```
git clone --recursive https://github.com/lixfz/gpu-box.git
cd gpu-box
docker build -t gpu-box:01 .
```

# 运行gpu-box

```
docker run --rm -it --gpu all gpu-box:01 bash
```
