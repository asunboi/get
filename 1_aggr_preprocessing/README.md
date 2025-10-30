INPUTS FOR PREPROCESSING
filtered_feature_bc_matrix.h5

## 03/10/2025
Modified prepare_aggr to do the motif finding found in [https://github.com/GET-Foundation/get_model/issues/11].
This is because to run the finetune_batac + finetune_lo, there needs to be a pretrained checkpoint; the checkpoint that is currently compatible with how hydra reads in the model checkpoints is the one published in the paper (./checkpoint-best.pth). Of note, this is a human checkpoint so there may be inconsistencies with mouse data.
The issue with using pretrain mouse checkpoints generated de-novo from predict_atac is that this occurs:

"RuntimeError: Error(s) in loading state_dict for GETRegionFinetune:
Missing key(s) in state_dict: "encoder.blocks.0.norm1.weight", "encoder.blocks.0.norm1.bias", "encoder.blocks.0.attn.q_bias", "encoder.blocks.0.attn.v_bias", "encoder.blocks.0.attn.qkv.weight", "encoder.blocks.0.attn.proj.weight", ...

Unexpected key(s) in state_dict: "mask_token", "head_mask.weight", "head_mask.bias", "encoder.encoder.blocks.0.norm1.weight", "encoder.encoder.blocks.0.norm1.bias", "encoder.encoder.blocks.0.attn.q_bias", "encoder.encoder.blocks.0.attn.v_bias", "encoder.encoder.blocks.0.attn.qkv.weight",

Looks like the predict atac checkpoint writer is outdated. Tried to fix this with [https://github.com/GET-Foundation/get_model/issues/20], but it seems that using the human checkpoint is just better / bug free for now.

## 02/28/2025
RUN AZIMUTH.R IN EMPTY CONDA ENVIRONMENT WITH MODULE ACTIVATE R/4.3.0

print(cell_number)
{'Astro': 2316, 'Endo': 698, 'L2/3 IT': 4544, 'L5 ET': 567, 'L5 IT': 7664, 'L5/6 NP': 299, 'L6 CT': 1745, 'L6 IT': 578, 'L6 IT Car3': 22, 'L6b': 147, 'Lamp5': 471, 'Meis2': 143, 'Micro-PVM': 1154, 'OPC': 575, 'Oligo': 2246, 'Peri': 135, 'Pvalb': 1076, 'Sncg': 74, 'Sst': 658, 'Sst Chodl': 17, 'VLMC': 563, 'Vip': 413}

The following cell types have more than 100 cells and library size > 3M, adding them to celltype_for_modeling
Astro number of cells: 2316, library size: 30515516
Endo number of cells: 698, library size: 5141633
L2/3 IT number of cells: 4544, library size: 92593264
L5 ET number of cells: 567, library size: 17506656
L5 IT number of cells: 7664, library size: 147254336
L5/6 NP number of cells: 299, library size: 5034932
L6 CT number of cells: 1745, library size: 35660816
L6 IT number of cells: 578, library size: 12727980
L6b number of cells: 147, library size: 3054597
Lamp5 number of cells: 471, library size: 7468353
Micro-PVM number of cells: 1154, library size: 9088682
OPC number of cells: 575, library size: 6691099
Oligo number of cells: 2246, library size: 19190540
Pvalb number of cells: 1076, library size: 23896946
Sst number of cells: 658, library size: 13008524
VLMC number of cells: 563, library size: 3888340
Vip number of cells: 413, library size: 6744065

https://github.com/GET-Foundation/get_model/issues/11
predict_ATAC and pretrain are both affected by this issue; (RuntimeError:` mat1 and mat2 shapes cannot be multiplied (1600x234 and 283x768))
currently I am going through the latter workaround where I modify the configuration to reduce the motifs to the level I have (234). Not sure how this affects the results / I should test how this affects the results. 

