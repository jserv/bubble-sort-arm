all: bubble

bubble:
	arm-linux-gnueabihf-gcc -o bubble bubble.s main.s vprintw.s -static

clean:
	rm -f bubble

run: bubble
	@qemu-arm bubble || echo "OK!"
