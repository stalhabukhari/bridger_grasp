# bridger_grasp

This repo contains code that's based on the following repos: [robotgradient/grasp_diffusion](https://github.com/robotgradient/grasp_diffusion).

## Environment Setup
~~Follow the steps in [robotgradient/grasp_diffusion](https://github.com/robotgradient/grasp_diffusion).~~

```shell
conda create -n se3dif_env python=3.8
pip install --upgrade pip
pip install lit cmake
conda install -c conda-forge suitesparse==5.10.1 scikit-sparse==0.4.8
conda install pytorch==2.0.1 torchvision==0.15.2 pytorch-cuda=11.7 -c pytorch -c nvidia -y
pip install -e . --use-pep517
```

then clone and install `mesh_to_sdf`:

```shell
git clone https://github.com/robotgradient/mesh_to_sdf && \
pip install -e mesh_to_sdf --use-pep517
```

## Usage
To train BRIDGER, run the following:
```
python scripts/train/train.py --spec_file pcl_si --model_name si
```

You can modify the objects you want to train by setting 'class_type' in 'PointcloudAcronymAndSDFDataset()'.

To use data-drive source policy, train cvae first and then train BRIDGER

```
e.g. Please keep the seed and data_size to be the same
python train.py --spec_file pcl_cvae --model_name cvae
python train.py --spec_file pcl_si --model_name si
```

To generate grasp samples

```
e.g. python scripts/sample/generate_pcl_si.py --prior_type heuristic
```

## BibTeX

To cite this work, please use:

```
@article{chen2024behavioral,
  title={Don’t Start from Scratch: Behavioral Refinement via Interpolant-based Policy Diffusion},
  author={Chen, Kaiqi and Lim, Eugene and Lin, Kelvin and Chen, Yiyang and Soh, Harold},
  journal={arXiv preprint arXiv:2402.16075},
  year={2024}
}
```