package main

import (
	"fmt"
	"time"
)

func main() {
	start := time.Now()

	for i := 0; i < 1000000; i++ {
		fmt.Println(i)
	}
	fmt.Println(time.Since(start))
}

//comment // //sdfasdasd
