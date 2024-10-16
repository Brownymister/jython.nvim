# jython.nvim

# Install

Jython interpreter needs to be installed on your system. You can download it from [here](https://www.jython.org/download).

Packer:

```lua
use {'brownymister/jython.nvim'}
```

Setup:

```lua
require('jython').config = {
    jar = true --- only if you use the jar file; if set to false it 'jyothn_path' will be handled as an executable
    jython_path = "/usr/bin/jython",
}
```

# Usage

| Command | Description |
| :Jython | Show help msg |
| :JR | Run the current file in a terminal window inside a new vim tab |
| :JRSplit | Run the current file in a terminal inside a split window |

# TODO

- [x] running jython interpreter (byo)
  - in terminal window inside nvim
- [ ] optional saving output in file
- [ ] automagicly execute on save
