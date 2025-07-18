# QIIME2 2025.4 GitPod Deployment

**Fast and efficient deployment of QIIME2 2025.4 via GitPod Workspaces using micromamba**

## Overview

This repository provides a complete GitPod Classic workspace setup for QIIME2 2025.4 Amplicon Distribution with optimized performance using micromamba instead of traditional conda/miniconda. The setup includes the q2-krona plugin for enhanced taxonomic visualization capabilities.

## What's New in 2025.4

- **New GitHub-based distribution system** - QIIME2 now distributes environment files through GitHub instead of data.qiime2.org
- **Enhanced documentation architecture** with the new Diátaxis-based system
- **Improved Docker workshop containers** for cloud-based teaching and research
- **Continued Python 3.10 support** for optimal bioconda compatibility

## Features

✅ **QIIME2 2025.4 Amplicon Distribution** - Latest stable release  
✅ **Micromamba package manager** - Faster than conda/miniconda, optimized for containers  
✅ **q2-krona plugin** - Interactive taxonomic visualization  
✅ **Krona tools** - Hierarchical data visualization  
✅ **GitPod Classic compatibility** - Tested with Large workspace class  
✅ **Error handling & retry logic** - Robust installation process  
✅ **VS Code extensions** - Python, Jupyter, and debugging support  

## Quick Start

### 1. Launch in GitPod

[![Open in GitPod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/YOUR_USERNAME/QIIME2-2025.4-Gitpod)

**Important:** Make sure to use a **Large** workspace class (minimum 16GB RAM) for optimal QIIME2 performance.

### 2. Wait for Setup

The initial setup takes approximately 10-15 minutes and includes:
- Micromamba installation and configuration
- QIIME2 2025.4 environment creation from GitHub distribution
- Krona tools installation and taxonomy database updates  
- q2-krona plugin installation and cache refresh

### 3. Verify Installation

Once setup is complete, verify your installation:

```bash
# Check QIIME2 version
qiime --version

# View detailed environment info
qiime info

# Test q2-krona plugin
qiime krona --help

# Check available plugins
qiime --help
```

## System Requirements

### GitPod Workspace Classes

| Class | vCPUs | RAM | Storage | QIIME2 Compatibility |
|-------|-------|-----|---------|---------------------|
| Small | 2 | 4GB | 30GB | ❌ Insufficient |
| Standard | 4 | 8GB | 30GB | ❌ Insufficient |
| **Large** | 8 | 16GB | 50GB | ✅ **Minimum recommended** |
| **XLarge** | 14 | 27GB | 75GB | ✅ **Optimal** |

**Recommendation:** Use Large workspace class minimum. XLarge is optimal for complex analyses and DADA2 operations.

## Technical Details

### Package Manager: Micromamba

This deployment uses **micromamba** instead of conda/miniconda for several advantages:
- **Faster installation** (~1 second vs several minutes)
- **Smaller footprint** - statically-linked executable
- **Better container performance** - optimized for CI/CD and cloud environments
- **Full conda compatibility** - drop-in replacement

### QIIME2 Distribution

QIIME2 2025.4 uses a new GitHub-based distribution system:

```
https://raw.githubusercontent.com/qiime2/distributions/refs/heads/dev/2025.4/amplicon/released/qiime2-amplicon-ubuntu-latest-conda.yml
```

This replaces the previous `data.qiime2.org` URLs and provides better version control and distribution management.

### Included Software

- **QIIME2 2025.4** - Complete amplicon analysis distribution
- **Python 3.10** - Optimized for bioconda compatibility  
- **Micromamba** - Fast conda-compatible package manager
- **Krona 2.8.1** - Hierarchical data visualization
- **q2-krona plugin** - QIIME2 integration for Krona plots
- **Jupyter Lab** - Interactive analysis environment

## Usage Examples

### Basic QIIME2 Commands

```bash
# Activate environment (done automatically)
micromamba activate qiime2-amplicon-2025.4

# Import data
qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path your-data \
  --input-format CasavaOneEightSingleLanePerSampleDirFmt \
  --output-path demux-paired-end.qza

# Create Krona plots with q2-krona
qiime krona collapse-and-plot \
  --i-table table.qza \
  --i-taxonomy taxonomy.qza \
  --o-krona-plot krona-plot.qzv
```

### Managing Environments

```bash
# List environments
micromamba env list

# Create additional environments
micromamba create -n myenv python=3.10

# Remove environments  
micromamba env remove -n myenv
```

## Troubleshooting

### Common Issues

**Environment creation fails:**
- Ensure Large workspace class is selected
- Check network connectivity
- Retry installation (script includes automatic retry logic)

**q2-krona plugin not found:**
```bash
# Reinstall q2-krona
pip install git+https://github.com/kaanb93/q2-krona.git
qiime dev refresh-cache
```

**Krona taxonomy update warnings:**
- These are usually network timeouts and can be safely ignored
- Krona will still function with existing databases

**Memory issues:**
- Upgrade to XLarge workspace class
- Monitor memory usage with `htop`
- Consider processing smaller datasets or using streaming operations

### Getting Help

- **QIIME2 Documentation:** https://library.qiime2.org/quickstart/amplicon
- **QIIME2 Forum:** https://forum.qiime2.org/
- **Amplicon Analysis Guide:** https://amplicon-docs.qiime2.org/
- **GitPod Documentation:** https://www.gitpod.io/docs/

## File Structure

```
.
├── .gitpod.Dockerfile    # Container configuration with micromamba
├── .gitpod.yml          # Workspace setup and task automation  
├── README.md            # This file
└── examples/            # (Optional) Example datasets and workflows
```

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Test changes with a fresh GitPod deployment
4. Submit a pull request

## License

This project is licensed under the MIT License. QIIME2 and its components are subject to their respective licenses.

## Citation

If you use this GitPod deployment in your research, please cite:

- **QIIME2:** Bolyen et al. (2019) Nature Biotechnology
- **Your publication:** Include a link to this repository

## Changelog

### v2025.4.0
- Updated to QIIME2 2025.4 with new GitHub-based distribution
- Switched from miniconda to micromamba for improved performance
- Updated documentation links to new QIIME2 docs architecture
- Added Large workspace class requirement
- Enhanced error handling and verification steps

### v2024.10.0 (Previous)
- QIIME2 2024.10 with traditional data.qiime2.org distribution
- Miniconda-based installation
- Original GitPod workspace configuration
