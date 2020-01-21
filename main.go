package main

import (
	"io/ioutil"
	"log"
	"os"
)

func main() {
	f, err := ioutil.TempFile("", "sample")
	err = os.Rename(f.Name(), "/etc/ssl/cert")
	if err != nil {
		log.Fatalf("failed moving, %s", err)
	}
}
