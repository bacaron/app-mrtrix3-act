<h1 align="center">mrtrix3 act</h1>

<p align="center">
  Runs MRtrix3 anatomically constrained tractography (ACT) from precomputed CSD fibre orientation distributions and a precomputed 5-tissue-type mask, without DWI or T1w inputs, and outputs a whole-brain .tck tractogram.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.709"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.709-blue.svg" alt="Run on brainlife.io"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Runs MRtrix3 anatomically constrained tractography (ACT) from precomputed CSD fibre orientation distributions and a precomputed 5-tissue-type mask, without DWI or T1w inputs, and outputs a whole-brain .tck tractogram.**

Runs mrtrix3 ACT (Anatomically Constrained Tractography) using either single- or multi-shell diffusion-weighted MRI data. Clone of https://doi.org/10.25663/bl.app.101 (written by Brent McPherson) that requires csd input and allows for 5tt probability mask and brainmask inputs. This app is a modification of other apps that do not require a DWI and T1w input. Because of this, tensor fits and tensor tracking is not possible within this app. The CSD and 5tt masks MUST be pregenerated before running this app.

| | |
|---|---|
| **Inputs** | `neuro/mask` · `neuro/csd` |
| **Outputs** | `neuro/track/tck` |
| **Container** | `brainlife/mrtrix3:3.0_RC3` |
| **Run it** | [doi.org/10.25663/brainlife.app.709](https://doi.org/10.25663/brainlife.app.709) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `mask` | `neuro/mask` (5tt) | yes | The path to the 5tt probability mask generated using the Tissue-type Segmentation app. |
| `csd` | `neuro/csd` | yes | The path to the CSD datatype files |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `tracking` | `neuro/track/tck` | The whole-brain tractogram, formatted as a .tck file |

<details>
<summary><b>Parameters</b> (13)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `min_length` | number | `10` | the minimum length a streamline may be |
| `max_length` | number | `200` | the maximum length a streamline may be |
| `imaxs` | number | `8` | Maximum lmax to use. If ens_lmax == False, then this will be the lmax used to generate the tractogram. If true, this is the max lmax. |
| `ens_lmax` | boolean | `true` | perform ensemble tracking on every lmax up to the maximum value passed |
| `curvs` | string | `5 10 20 40 80` | the maximum curvature angle streamline can take during tracking |
| `num_fibers` | number | `15000` | the number of streamlines to produce per parameter combination |
| `do_detr` | boolean | `true` | perform deterministic tractography |
| `do_prb1` | boolean | `false` | perform mrtrix2 probabilistic tractography |
| `do_prb2` | boolean | `true` | perform mrtrix3 probabilistic tractography |
| `do_fact` | boolean | `false` | Perform FACT tracking |
| `fact_dirs` | number | `3` | The number of directions to perform FACT tracking on. min: 1 max: 5 |
| `fact_fibs` | number | `0` | The number of FACT fibers to track per lmax. min: 0 max: 1000000 |
| `stepsize` | number |  | If you want to predefine step size, do it here |

</details>

<!-- brainlife-app:end -->

## Versions on brainlife.io

This repository hosts several Apps, each built from its own branch.

| App | Branch | Run it | Status |
|---|---|---|---|
| Anatomically Constrained Tractography using precomputed 5tt & CSD - No DWI & T1w input | [`1.3-no_dwi-no_t1w`](https://github.com/bacaron/app-mrtrix3-act/tree/1.3-no_dwi-no_t1w) | [doi:10.25663/brainlife.app.709](https://doi.org/10.25663/brainlife.app.709) | current |
| Anatomically Constrained Tractography using precomputed 5tt & CSD | [`1.3`](https://github.com/bacaron/app-mrtrix3-act/tree/1.3) | [doi:10.25663/brainlife.app.297](https://doi.org/10.25663/brainlife.app.297) | available |
| Fit Constrained Deconvolution Model for Tracking | [`csd_generation-v1.0`](https://github.com/bacaron/app-mrtrix3-act/tree/csd_generation-v1.0) | [doi:10.25663/brainlife.app.238](https://doi.org/10.25663/brainlife.app.238) | available |

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.709](https://doi.org/10.25663/brainlife.app.709), choose `neuro/mask`, `neuro/csd` from your project, set the parameters and press **Execute**. The results are saved to your project as `neuro/track/tck`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `brainlife/mrtrix3:3.0_RC3`), [`jq`](https://jqlang.github.io/jq/).

1. Clone this repository and check out the App's branch (`git checkout 1.3-no_dwi-no_t1w`).
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "mask": "/path/to/mask/mask",
       "response": "/path/to/csd/response",
       "lmax2": "/path/to/csd/lmax2",
       "lmax4": "/path/to/csd/lmax4",
       "lmax6": "/path/to/csd/lmax6",
       "lmax8": "/path/to/csd/lmax8",
       "lmax10": "/path/to/csd/lmax10",
       "lmax12": "/path/to/csd/lmax12",
       "lmax14": "/path/to/csd/lmax14",
       "min_length": 10,
       "max_length": 200,
       "imaxs": 8,
       "ens_lmax": true,
       "curvs": "5 10 20 40 80",
       "num_fibers": 15000,
       "do_detr": true,
       "do_prb1": false,
       "do_prb2": true,
       "do_fact": false,
       "fact_dirs": 3,
       "fact_fibs": 0,
       "stepsize": "<number>"
   }
   ```

3. Run `./main`.

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- Anatomically Constrained Tractography using precomputed 5tt & CSD - No DWI & T1w input. brainlife.io App. [doi:10.25663/brainlife.app.709](https://doi.org/10.25663/brainlife.app.709)
- Smith RE, Tournier J-D, Calamante F, Connelly A. Anatomically-constrained tractography: improved diffusion MRI streamlines tractography through effective use of anatomical information. NeuroImage 62(3):1924-1938 (2012).
- Takemura H, Caiafa CF, Wandell BA, Pestilli F. Ensemble tractography. PLoS Computational Biology 12(2):e1004692 (2016).
- Tournier J-D et al. MRtrix3: A fast, flexible and open software framework for medical image processing and visualisation. NeuroImage 202:116137 (2019). [doi:10.1016/j.neuroimage.2019.116137](https://doi.org/10.1016/j.neuroimage.2019.116137)
- Smith, R. E., Tournier, J. D., Calamante, F., & Connelly, A. (2012). Anatomically-constrained tractography: improved diffusion MRI streamlines tractography through effective use of anatomical information. Neuroimage, 62(3), 1924-1938.
- Takemura, H., Caiafa, C. F., Wandell, B. A., & Pestilli, F. (2016). Ensemble tractography. PLoS computational biology, 12(2), e1004692.
- Jenkinson et al. FSL. *NeuroImage* 62:782-790 (2012). [doi:10.1016/j.neuroimage.2011.09.015](https://doi.org/10.1016/j.neuroimage.2011.09.015)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

- Brent McPherson
- Brad Caron

**Contributors**

- Soichi Hayashi

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io, which runs this App, is publicly funded by Wellcome, the U.S. National Institutes of Health and the U.S. National Science Foundation; acknowledging that support helps keep it running.</sub>
