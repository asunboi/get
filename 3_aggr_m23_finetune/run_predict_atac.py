import hydra

from get_model.config.config import Config
from get_model.run_region import run_zarr as run


@hydra.main(config_path="./", config_name="predict_atac_config.yaml")
def main(cfg: Config):
    run(cfg)


if __name__ == "__main__":
    main()
