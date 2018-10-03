CC=gcc
SEQ_CFLAGS=-std=gnu11
SEQ_LDFLAGS=
PAR_CFLAGS=$(SEQ_CFLAGS) -DQSPARALLEL -fcilkplus
PAR_LDFLAGS=$(SEQ_LDFLAGS) -lcilkrts

TARGETS=qs-sequential qs-parallel
all: $(TARGETS)

qs-sequential: qs-sequential.c
	gcc -o $@ $(SEQ_CFLAGS) $^ $(SEQ_LDFLAGS)

qs-parallel: qs-sequential.c qs-parallel.c
	gcc -o $@ $(PAR_CFLAGS) $^ $(PAR_LDFLAGS)


clean:
	rm -f $(TARGETS)

