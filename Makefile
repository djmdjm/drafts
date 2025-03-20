
TARGETS=draft-ietf-sshm-ssh-agent.txt draft-miller-ssh-ping.txt draft-miller-ssh-cert.txt draft-miller-sshm-strict-kex.txt draft-miller-sshm-aes-gcm.txt

all: $(TARGETS)

.SUFFIXES: .xml .txt
.xml.txt:
	xml2rfc $< -o $@

clean:
	@rm -f $(TARGETS) *.core core
