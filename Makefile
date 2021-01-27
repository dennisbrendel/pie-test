all : pie non-pie one-step-pie mixed

pie : main-pie.o lib-pie.o
	cc -pie -o $@ $^

non-pie : main-nonpie.o lib-nonpie.o
	cc -o $@ $^

mixed : main-pie.o lib-nonpie.o
	cc -o $@ $^

one-step-pie: main.c lib.c
	cc -pie -fpie -o $@ $^

main-pie.o : main.c
	cc -fpic -c -o $@ $^

main-nonpie.o : main.c
	cc -c -o $@ $^

lib-pie.o : lib.c
	cc -fpic -c -o $@ $^

lib-nonpie.o : lib.c
	cc -c -o $@ $^

.PHONY: all clean

clean :
	$(RM) main-pie.o main-nonpie.o lib-pie.o lib-nonpie.o \
				pie non-pie one-step-pie mixed

