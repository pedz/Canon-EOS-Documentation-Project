
ORG_FILES = base.org \
  macros.org \
  Intro.org \
  AF\ Focusing.org \
  AF\ Selection.org \
  AF\ Button\ Functions\ Videos.org \
  Functions\ available\ for\ customization.org \
  Multi-controller.org \
  AF-ON\ Button\ on\ Canon\ EOS\ R1.org \
  Canon\ EOS\ R1\ Menus.org \
  Canon\ EOS\ R5\ Mark\ II\ Menus.org

all: Canon\ EOS\ R1\ Suppliment.html Canon\ EOS\ R5\ Mark\ II\ Suppliment.html index.html

Canon\ EOS\ R1\ Suppliment.html: Canon\ EOS\ R1\ Suppliment.org R1\ menu\ table.org ${ORG_FILES}
	emacs --batch -l do-make.el 'Canon EOS R1 Suppliment.org'

Canon\ EOS\ R5\ Mark\ II\ Suppliment.html: Canon\ EOS\ R5\ Mark\ II\ Suppliment.org R5MkII\ menu\ table.org ${ORG_FILES}
	emacs --batch -l do-make.el 'Canon EOS R5 Mark II Suppliment.org'

index.html: index.org
	emacs --batch -l do-make.el index.org


