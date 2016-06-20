DEST_DIR=/usr/share/texmf/tex/latex/beamer/base/themes/theme
SOURCE_DIR=theme
TO_COPY=beamerthemeProso.sty beamerthemeProsoLight.sty  proso-logo.png proso-logo-small.png

build.example:
	cd example; pdflatex example.tex; \
	rm -rf *.aux *.log *.nav *.out *.snm *.toc;

install.ubuntu:
	echo " [beamer theme directory] $(DEST_DIR)"; \
	for FILE in $(TO_COPY); do\
		echo " [copy] $(SOURCE_DIR)/$$FILE"; \
		sudo cp "$(SOURCE_DIR)/$$FILE" "$(DEST_DIR)"; \
		sudo chmod +r "$(DEST_DIR)/$$FILE"; \
	done;\
	sudo texhash;\

uninstall.ubuntu:
	echo " [beamer theme directory] $(DEST_DIR)"; \
	for FILE in $(TO_COPY); do\
		echo " [remove] $(DEST_DIR)/$$FILE"; \
		sudo rm -f "$(DEST_DIR)/$$FILE"; \
	done;\
	sudo texhash;\
