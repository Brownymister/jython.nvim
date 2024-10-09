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
    jython_path = "/usr/bin/jython",
}
```

# TODO

- [x] running jython interpreter (byo)
  - in terminal window inside nvim
- [] optional saving output in file
- [] automagicly execute on save
