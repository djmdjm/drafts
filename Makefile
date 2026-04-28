
TARGETS=draft-ietf-sshm-ssh-agent.txt draft-miller-ssh-ping.txt draft-ietf-sshm-cert.txt draft-ietf-sshm-strict-kex.txt draft-miller-sshm-aes-gcm.txt draft-ietf-sshm-hostkey-update.txt draft-miller-sshm-mldsa65-ed25519-composite-sigs.txt

all: $(TARGETS)

.SUFFIXES: .xml .txt
.xml.txt:
	xml2rfc $< -o $@
	@set -e ;check=`basename $@ .txt`; if test -x check-$$check ; then echo -n "Checking $<: " ; ./check-$$check; echo OK; fi

clean:
	@rm -f $(TARGETS) *.core core
