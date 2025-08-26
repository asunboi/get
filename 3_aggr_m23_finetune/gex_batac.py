import hydra

from get_model.config.config import Config
from get_model.run_region import run_zarr as run


@hydra.main(config_path="./", config_name="interpret_gex_nopretrain_config.yaml")
def main(cfg: Config):
    # celltype_for_modeling = ['Endo',
    #                      'L5 ET',
    #                      'L5 IT',
    #                      'L6 CT',
    #                      'L6b',
    #                      'Lamp5',
    #                      'Meis2',
    #                      'Micro-PVM',
    #                      'OPC',
    #                      'Oligo',
    #                      'Peri',
    #                      'Pvalb',
    #                      'Sst',
    #                      'VLMC',
    #                      'Vip']

    celltype_for_modeling = ['Astro', 'L6 IT']
    
    for celltype in celltype_for_modeling:
        cfg.dataset.leave_out_celltypes = celltype
        trainer = run(cfg)

if __name__ == "__main__":
    main()
