# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# Could not resolve CheckpointLoaderSimple (unknown registry and no aux_id)
# Could not resolve CLIPSetLastLayer (unknown registry and no aux_id)
# Could not resolve MultiLoRAStack (unknown registry and no aux_id)
# Could not resolve FaceDetailer (unknown registry and no aux_id)
# Could not resolve UltralyticsDetectorProvider (unknown registry and no aux_id)
# Could not resolve SAMLoader (unknown registry and no aux_id)
# Could not resolve UltralyticsDetectorProvider (duplicate) (unknown registry and no aux_id)
# Could not resolve mxSeed (unknown registry and no aux_id)
# Could not resolve ConditioningMultiCombine (unknown registry and no aux_id)

# download models into comfyui
RUN comfy model download --url https://huggingface.co/knifeayumu/StableDiffusionXL_Collection/blob/b9bdbce55adfba10b36ec290a13748193cb0e3f6/animagineXL40_v4Opt.safetensors --relative-path models/checkpoints --filename animagineXL40_v4Opt.safetensors
RUN comfy model download --url https://huggingface.co/ashllay/YOLO_Models/blob/e07b01219ff1807e1885015f439d788b038f49bd/bbox/nipples_yolov8s.pt --relative-path models/ultralytics/bbox --filename nipples_yolov8s.pt
RUN comfy model download --url https://dl.fbaipublicfiles.com/segment_anything/sam_vit_b_01ec64.pth --relative-path models/sams --filename sam_vit_b_01ec64.pth
RUN comfy model download --url https://huggingface.co/uooogh/nipples_yolov8s-seg/blob/main/nipples_yolov8s-seg.pt --relative-path models/ultralytics/segm --filename nipples_yolov8s-seg.pt

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
