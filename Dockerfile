ARG CUDA_VERSION=12.8.1
ARG IMAGE_DISTRO=ubuntu24.04

FROM nvcr.io/nvidia/cuda:${CUDA_VERSION}-devel-${IMAGE_DISTRO} AS builder

WORKDIR /box

COPY third /box/

RUN cd /box/gpu-burn \
    && make
RUN cd /box/nccl-tests \
    && make -j 16

FROM nvcr.io/nvidia/cuda:${CUDA_VERSION}-runtime-${IMAGE_DISTRO}

COPY --from=builder /box/gpu-burn/gpu_burn /box/gpu-burn/
COPY --from=builder /box/gpu-burn/compare.ptx /box/gpu-burn/
COPY --from=builder /box/nccl-tests/build /box/nccl-tests

WORKDIR /box

#ENTRYPOINT ["bash", "-c", "cd /box/gpu-burn; ./gpu_burn 60"]
ENTRYPOINT []
CMD ["bash", "-c", "cd /box/gpu-burn; ./gpu_burn 60"]
