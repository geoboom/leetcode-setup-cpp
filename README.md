# LeetCode Problem Setup (C++)

This is a simple scraping utiltiy that makes a folder for a given LeetCode problem url and copies your C++ `template.cpp` into it, and renames it to `solve.cpp` within the folder.

## Installation

Before proceeding, ensure you have `python3` installed in your system.

1. Clone this repository into your LeetCode directory (e.g. `/home/<username>/leetcode/`):

   ```bash
   git clone https://github.com/geoboom/leetcode-setup-cpp.git _setup
   ```

   Here, I cloned it into `_setup/` subdirectory for convenience. You may change the target directory name from `_setup` to something else. If so, then adapt the rest of the instructions to use your target directory name instead of `_setup`.

2. Install the required dependencies:

   ```bash
   cd _setup                        # go into the project folder
   python3 -m venv venv             # set up the python3 virtual environment
   source venv/bin/activate         # activate the virtual environment
   pip install -r requirements.txt  # install dependencies specified in requirements.txt
   deactivate                       # deactivate the virtual environment
   cd ..                            # leave the project folder
   ```

3. (Optional) Edit `_setup/template.cpp` to your liking.

## Usage

The following assume that you're in your LeetCode problems directory and the repository is cloned into the `./_setup` subdirectory i.e. you're in `/home/<username>/leetcode/` and the repository is in `/home/<username>/leetcode/_setup/`.

### Syntax

```bash
./_setup/get.sh <leetcode problem url>
```

### Example

```bash
./_setup/get.sh https://leetcode.com/problems/subarray-sum-equals-k/
```

Creates `560-subarray-sum-equals-k/` and `560-subarray-sum-equals-k/solve.cpp` in `/home/<username>/leetcode/`.

**Note:** if `560-subarray-sum-equals-k/solve.cpp` already exists, then the program will not do anything.
