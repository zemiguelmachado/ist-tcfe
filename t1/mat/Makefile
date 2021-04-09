all: octave_malhas.log octave_nos.log


octave_malhas.log: malhas.m
	octave $< > $@
	
octave_nos.log: nos.m
	octave $< > $@
clean:
	@rm -f octave_malhas.log octave_nos.log Nos_tab.tex Malhas_tab.tex octave-workspace *.eps *~

.PHONY: clean
