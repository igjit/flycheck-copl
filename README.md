# flycheck-copl

Flycheck for CoPL (the book ["Concepts of Programming Languages"](http://www.fos.kuis.kyoto-u.ac.jp/~igarashi/CoPL/)).

## Requirement

- Emacs 24.3 or higher
- [Flycheck][]
- [copl-mode][]
- [copl-tools][]

### copl-tools on Docker

If you prefer to run [copl-tools][] on Docker, [docker-copl-tools][] is available.

Install docker-copl-tools.

```sh
git clone git@github.com:igjit/docker-copl-tools.git
cd docker-copl-tools/
docker build -t copl-tools .
```

And add the `bin` directory to Emacs `exec-path`. (Replace `path/to/` to where you installed.)

```el
(add-to-list 'exec-path "path/to/docker-copl-tools/bin")
```

## Usage

### Select the game

Specify the game as [file local variable][] in your derivation file (`*.copl`).

```
// -*- copl-game: "CompareNat1" -*-
```

## Sample Configuration

```el
(eval-after-load 'flycheck
  '(flycheck-copl-setup))

(defun my-copl-mode-setup ()
  (flycheck-mode +1))

(add-hook 'copl-mode-hook 'my-copl-mode-setup)
```

[Flycheck]: https://github.com/flycheck/flycheck
[copl-mode]: https://github.com/igjit/copl-mode
[copl-tools]: https://github.com/aigarashi/copl-tools
[docker-copl-tools]: https://github.com/igjit/docker-copl-tools
[file local variable]: https://www.gnu.org/software/emacs/manual/html_node/emacs/Specifying-File-Variables.html#Specifying-File-Variables
