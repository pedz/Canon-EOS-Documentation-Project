
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

all: Canon\ EOS\ R1\ Supplement.html Canon\ EOS\ R5\ Mark\ II\ Supplement.html index.html

Canon\ EOS\ R1\ Supplement.html: Canon\ EOS\ R1\ Supplement.org R1\ menu\ table.org ${ORG_FILES} do-make.el
	emacs --batch -l do-make.el 'Canon EOS R1 Supplement.org'

Canon\ EOS\ R5\ Mark\ II\ Supplement.html: Canon\ EOS\ R5\ Mark\ II\ Supplement.org R5MkII\ menu\ table.org ${ORG_FILES} do-make.el
	emacs --batch -l do-make.el 'Canon EOS R5 Mark II Supplement.org'

index.html: index.org do-make.el
	emacs --batch -l do-make.el index.org


