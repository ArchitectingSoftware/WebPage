#!/bin/bash
ssh -L 30432:localhost:30432 -L 30080:localhost:30080 -L 9080:localhost:9080 gb -N &
