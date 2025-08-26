import hydra

from get_model.config.config import Config
from get_model.run_region import run_scramble as run


@hydra.main(config_path="./", config_name="interpret_gex_scramble_config.yaml")
def main(cfg: Config):
    for celltype in ['L6 IT', 'Astro']:
        cfg.dataset.leave_out_celltypes = celltype
        trainer = run(cfg)


if __name__ == "__main__":
    main()
