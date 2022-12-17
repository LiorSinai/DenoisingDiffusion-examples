# DenoisingDiffusion-examples.jl

Examples using the package at [github.com/LiorSinai/DenoisingDiffusion.jl](https://github.com/LiorSinai/DenoisingDiffusion.jl).

A pure Julia implementation of denoising diffusion probabilistic models as popularised in [Denoising Diffusion Probabilistic Models by Jonathan Ho, Ajay Jain and Pieter Abbeel (2020)](https://arxiv.org/abs/2006.11239)

## Installation

Download the DenoisingDiffusion GitHub repository (it is not registered). Then in the Julia REPL:
```
julia> ] #enter package mode
(@v1.x) pkg> dev path\\to\\DenoisingDiffusion
julia> using Revise # allows dynamic edits to code
julia> using DenoisingDiffusion
```

Optionally, tests can be run with:
```
(@v1.x) pkg> test DenoisingDiffusion
```
This repository uses FastAi's [nbdev](https://nbdev.fast.ai/tutorials/git_friendly_jupyter.html) to manage the Jupyter Notebooks for Git. This requires a Python installation of nbdev. To avoid using it, follow the steps in .gitconfig.
