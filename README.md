[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-brainlife.app.297-blue.svg)](https://doi.org/https://doi.org/10.25663/brainlife.app.297)

# Anatomically Constrained Tractography using precomputed 5tt & CSD

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Runs MRtrix3 anatomically constrained tractography (ACT) from precomputed CSD fibre orientation distributions and a precomputed 5-tissue-type mask, without DWI or T1w inputs, and outputs a whole-brain .tck tractogram.**

Runs mrtrix3 ACT (Anatomically Constrained Tractography) using either single- or multi-shell diffusion-weighted MRI data. Clone of https://doi.org/10.25663/bl.app.101 (written by Brent McPherson) that requires csd input and allows for 5tt probability mask and brainmask inputs. This app is a modification of other apps that do not require a DWI and T1w input. Because of this, tensor fits and tensor tracking is not possible within this app. The CSD and 5tt masks MUST be pregenerated before running this app.

| | |
|---|---|
| 📥 **Inputs** | `neuro/mask` · `neuro/csd` |
| 📤 **Outputs** | `neuro/track/tck` |
| 🐳 **Container** | `brainlife/mrtrix3:3.0_RC3` |
| 🔗 **Run it** | [doi.org/10.25663/brainlife.app.709](https://doi.org/10.25663/brainlife.app.709) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `mask` | `neuro/mask` (5tt) | yes | The path to the 5tt probability mask generated using the Tissue-type Segmentation app. |
| `csd` | `neuro/csd` | yes | The path to the CSD datatype files |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `tracking` | `neuro/track/tck` | The whole-brain tractogram, formatted as a .tck file |

<details>
<summary><b>⚙️ Parameters</b> (13)</summary>

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

📚 **References used by this App:**
- Smith RE, Tournier J-D, Calamante F, Connelly A. Anatomically-constrained tractography: improved diffusion MRI streamlines tractography through effective use of anatomical information. NeuroImage 62(3):1924-1938 (2012).
- Takemura H, Caiafa CF, Wandell BA, Pestilli F. Ensemble tractography. PLoS Computational Biology 12(2):e1004692 (2016).
- Tournier J-D et al. MRtrix3: A fast, flexible and open software framework for medical image processing and visualisation. NeuroImage 202:116137 (2019). [doi:10.1016/j.neuroimage.2019.116137](https://doi.org/10.1016/j.neuroimage.2019.116137)
- Avesani P et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. Sci Data 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

<!-- brainlife-app:end -->

This app will This app will perform Anatomically-Constrained Tractography (ACT) using precomputed tissue-type mask for seeding and fiber orientation distribution (FODs) computed from the Constrained Spherical Deconvolution Model. This app takes in a dwi, anatomical/t1w, and csd datatypes as mandatory inputs, with the tissue-type mask and dwi brainmask as optional inputs. This app will output a tractogram (tck) datatype and a tensor datatype from the DTI model. This is all performed within MrTrix3. It is important to note that this app is purely a copy of RACE-Track (https://doi.org/10.25663/bl.app.101), except modified to take in the tissue-type and CSD datatypes as inputs.

### Authors

- Brent McPherson (bcmcpher@iu.edu)
- Brad Caron (bacaron@utexas.edu)

### Contributors

- Soichi Hayashi (shayashi@iu.edu)

### Funding Acknowledgement

brainlife.io is publicly funded and for the sustainability of the project it is helpful to Acknowledge the use of the platform. We kindly ask that you acknowledge the funding below in your publications and code reusing this code.

[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-ACI-1916518](https://img.shields.io/badge/NSF_ACI-1916518-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1916518)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://grantome.com/grant/NIH/R01-EB029272-01)

### Citations

We kindly ask that you cite the following articles when publishing papers and code using this code.

1. Smith, R. E., Tournier, J. D., Calamante, F., & Connelly, A. (2012). Anatomically-constrained tractography: improved diffusion MRI streamlines tractography through effective use of anatomical information. Neuroimage, 62(3), 1924-1938.

2. Takemura, H., Caiafa, C. F., Wandell, B. A., & Pestilli, F. (2016). Ensemble tractography. PLoS computational biology, 12(2), e1004692.

3. Tournier, J. D., Smith, R., Raffelt, D., Tabbara, R., Dhollander, T., Pietsch, M., … & Connelly, A. (2019). MRtrix3: A fast, flexible and open software framework for medical image processing and visualisation. NeuroImage, 202, 116137. https://doi.org/10.1016/j.neuroimage.2019.116137

 4.Avesani, P., McPherson, B., Hayashi, S. et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. Sci Data 6, 69 (2019). https://doi.org/10.1038/s41597-019-0073-y

#### MIT Copyright (c) 2020 brainlife.io The University of Texas at Austin and Indiana University

## Running the App

### On Brainlife.io

You can submit this App online at [https://doi.org/https://doi.org/10.25663/brainlife.app.297](https://doi.org/https://doi.org/10.25663/brainlife.app.297) via the 'Execute' tab.

### Running Locally (on your machine)

1. git clone this repo

2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
	"dwi": "/input/dwi/dwi.nii.gz",
	"anat": "/input/anat/t1.nii.gz",
	"mask": "/input/5tt/mask.nii.gz",
	"brainmask": "/input/brainmask/mask.nii.gz"
	"lmax2": "/input/csd/lmax2.nii.gz",
	"tensor_fit": 1000,
	"min_length": 10,
	"max_length": 200,
	"imaxs": 2,
	"ens_lmax": false,
	"curvs": 35,
	"num_fibers": 10000,
	"do_dtdt": false,
	"do_dtpb": false,
	"do_detr": "false",
	"do_prb1": false,
	"do_prb2": true,
	"do_fact": false,
	"fact_dirs": 3,
	"fact_fibs": 5000,
	"premask": false
}
```

### Sample Datasets

You can download sample datasets from Brainlife using [Brainlife CLI](https://github.com/brain-life/cli).

```
npm install -g brainlife
bl login
mkdir input
bl dataset download
```

3. Launch the App by executing 'main'

```bash
./main
```

## Output

The main output of this App is a track/tck datatype and tensor datatype.

#### Product.json

The secondary output of this app is `product.json`. This file allows web interfaces, DB and API calls on the results of the processing.

### Dependencies

This App only requires [singularity](https://www.sylabs.io/singularity/) to run. If you don't have singularity, you will need to install following dependencies.   

- MRtrix3: https://www.mrtrix.org/
- FSL: https://fsl.fmrib.ox.ac.uk/fsl/fslwiki
- ANTs: http://stnava.github.io/ANTs/

#### MIT Copyright (c) 2020 brainlife.io The University of Texas at Austin and Indiana University
