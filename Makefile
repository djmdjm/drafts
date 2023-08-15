
TARGETS=draft-miller-ssh-agent.txt draft-miller-ssh-ping.txt

all: $(TARGETS)

.SUFFIXES: .xml .txt
.xml.txt:
	xml2rfc $< -o $@

clean:
	@rm -f $(TARGETS) *.core core
