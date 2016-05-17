
TARGETS=draft-miller-ssh-agent.txt

all: $(TARGETS)

%.txt : %.xml
	xml2rfc $< -o $@

clean:
	@rm -f $(TARGETS)
