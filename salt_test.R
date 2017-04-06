# https://cran.r-project.org/web/packages/sodium/vignettes/intro.html

install.packages("sodium")
library("sodium")
"package:sodium" %in% search()

test <- hash(charToRaw("test 123"))
print(test)
str <- bin2hex(test)
print(str)
length(hex2bin(str))

ls("package:sodium")
ls(pos = 2); # if sodium is in the 2nd position
search();

charToRaw("nopass")
sodium::sha256(charToRaw("nopass"))
mykey <- sodium::keygen();

sodium::pubkey(mykey);

sodium::bin2hex(sha256(charToRaw("dougpass")))
#> "e77a58908f66bf61ac22e5d6131288c54295cfb97153d1bf180eff97f3b53232"
sodium::bin2hex(sha256(charToRaw("jeffpass")))
#> "6eb7a71adf3b595972a9bc54fb8f15548634aa9fe7e1bfefef46cb14c3c1ab14"